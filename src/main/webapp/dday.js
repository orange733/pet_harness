var inputStartDay = "2021-01-01";
var today = new Date();
var startDay = new Date(inputStartDay);
var year = startDay.getFullYear();
var month = startDay.getMonth() + 1;
var day = startDay.getDate(); 

var startMilli = startDay.getTime();
var todayMilli = today.getTime();
var calcDay = 24 * 60 * 60 * 1000;
var passedDay = Math.round((todayMilli - startMilli)/calcDay);
   if(passedDay < 0){
      document.querySelector("#today").innerHTML = "<h3>" + passedDay * -1 + "일 남음<h3>"
      }
   else{
      document.querySelector("#today").innerHTML = "<h3>" + passedDay + "일 지남<h3>"
   }
   document.querySelector("#startDay").innerHTML = "올해 첫 접종일: " +  year + "년" + month + "월" + day + "일";
   calcDate(30);
   calcDate(60);
   calcDate(180);
   calcDate(365);

function calcDate(number){
   var futureMilli = startMilli + (calcDay * number);
   var dDay = Math.round((futureMilli - todayMilli) / calcDay);
      if(number == 365){
         year = startDay.getFullYear() + 1;
         month = startDay.getMonth() + 1;
         day = startDay.getDate();
         }
      else{
         var futureDate = new Date(futureMilli);
         year = futureDate.getFullYear();
         month = futureDate.getMonth() + 1;
         day = futureDate.getDate();
         }
      console.log(number);
         if(dDay > 0){
            document.querySelector("#dday" + number).innerHTML = dDay + "일 남음<br>" + year + "년" + month + "월" + day + "일";
         }
         else {
            document.querySelector("#dday" + number).innerHTML = dDay * -1 + "일 지남<br>" + year + "년" + month + "월" + day + "일";
            }
               
            }
