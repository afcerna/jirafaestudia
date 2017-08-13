$(document).on('turbolinks:load', function(){
var clock = $("time")
var start = $ ('.start')
var stop = $ (".stop")
var reset = $ (".reset")
var setPom = $(".setPom")
var sec = 0, min = 0, hour = 0, mil = 0, t=0;
var color = "#ffffff";
var s = 0;
var currentTimePomodoro = 0;
var timePomodoro = 5;
var currentTimeBreak = 0;
var timeBreak = 3;
var currentTimeLongBreak = 0;
var TimeLongBreak = 5;
var currentPomodoroInCyc = 1;
var pomodoroPerCyc = 3;
var clockStatus = 0;



function setColorBackground (){
  if (s == 0) {
    color = "#143109";
  };
  if (s == 1) {
    color = "#009dc4";
  };
  if (s == 2) {
    color = "#9201ba";
  }

  switchBackground ();
};

function switchBackground (){
  $('#stopwatch').css("background-color", color);
};

function add2(){
  if (s == 0){
    currentTimePomodoro++;
  }
  if (s == 1) {
    currentTimeBreak++;
  };
  if (s == 2) {
    currentTimeLongBreak++;
  }
};


function add() {
  mil++;

  if (mil >= 100){
    add2();
    setColorBackground();
    sec++;
    mil = 0;
  }
  if(sec >= 60) {
    min++;
    sec = 0;
  };

  if (min >= 60) {
    min = 0;
    hour++;
  };



  if (currentTimePomodoro == timePomodoro && currentPomodoroInCyc < pomodoroPerCyc){
    s = 1;
    setColorBackground();
    currentTimePomodoro = 0;
    currentPomodoroInCyc++;
  };

  if (currentTimePomodoro == timePomodoro && currentPomodoroInCyc == pomodoroPerCyc){
    s = 2;
    setColorBackground();
    currentTimePomodoro = 0;
    currentPomodoroInCyc = 1;
  };

  if (currentTimeBreak == timeBreak) {
    s = 0;
    setColorBackground();
    currentTimeBreak = 0;
  };

  if (currentTimeLongBreak == TimeLongBreak) {
    s = 0;
    setColorBackground();
    currentTimeLongBreak = 0;
  }

function makeTimeString() {
  return (hour ? (hour > 9 ? hour : "0" + hour) : "00") + ":" + (min ? (min > 9 ? min : "0" + min) : "00") + ":" + (sec > 9 ? sec : "0" + sec)

};

clock.html(makeTimeString);

clockStart();

};
function clockPlay() {
  if (clockStatus != 1) {
    clockStatus = 1;
    clockStart();
  }
};

function clockStart() {
  t = setTimeout (add, 10);
};

function resetClock() {
  clock.html("00:00:00")
  t = 0;
  hour = 0;
  min =  0;
  sec = 0;
  color = "#EAEAEA";
  switchBackground();
};

function stopClock () {
  clearTimeout(t);
  color = "#DD6E42";
  switchBackground();
  clockStatus = 0;
};


function archive () {

};


  reset.click(resetClock);
  stop.click(stopClock);
  start.click(clockPlay);
});
