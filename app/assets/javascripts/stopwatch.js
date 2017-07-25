$(document).on('turbolinks:load', function(){
var clock = $("time")
var start = $ ('.start')
var stop = $ (".stop")
var reset = $ (".reset")
var sec = 0, min = 0, hour = 0, mil = 0, t=0;
var color = "#F0FFFF";

function switchBackground (){
  $('#stopwatch').css("background-color", color);
}

function add() {
  mil++;
  if (mil >= 100){
    mil = 0;
    sec++;
  }
  if(sec >= 60) {
    sec = 0;
    min++;
  };

  if (min >= 60) {
    min = 0;
    hour++;
    color = "#006600";
    switchBackground();
  };
  if (sec == 25){
    color = "#4F6D7A";
    switchBackground();
  };
  if (sec == 55){
    color = "#4F6D7A";
    switchBackground();
  };
  if (sec == 30){
    color = "#143109";
    switchBackground();
  };
  if (sec == 00){
    color = "#143109";
    switchBackground();
  };







function makeTimeString() {
  return (hour ? (hour > 9 ? hour : "0" + hour) : "00") + ":" + (min ? (min > 9 ? min : "0" + min) : "00") + ":" + (sec > 9 ? sec : "0" + sec)

};

clock.html(makeTimeString);

clockStart();

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
};

function archive () {


  hour
  min

};


  reset.click(resetClock);
  stop.click(stopClock);
  if (t==0){
  start.click(clockStart);
  };
  archive.click(archive);
});
