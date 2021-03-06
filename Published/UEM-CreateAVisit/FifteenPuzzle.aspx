﻿<%@ Page Title="" Language="VB" MasterPageFile="~/OfPuppets.master" AutoEventWireup="false" CodeFile="FifteenPuzzle.aspx.vb" Inherits="UEM_CreateAVisit_FifteenPuzzle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../Script/dtagentApi.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
 <style type="text/css">
 table
 {
     border: 1px solid black;   
 }
 table.FifteenPuzzle td
 {
 	border: 1px solid white;
 	height: 100px;
 	text-align: center;
	width: 100px;
 }
 td.empty
 {
    border: 0px;   
 }
 </style>

 <script type="text/javascript">
     //Fix checkWin so that it only checks if a move is completed
     //I need a boolean variable to tell me and then an IF statement at then end for the alert window

     //*******************************************************
     //The next functions keep track of how long the User
     // has been figuring out the puzzle

     //This function starts the timer for the page
     var seconds = 0;
     function startTimer() {
         window.setInterval("updateTime()", 1000);
     }

     //This function updates the time every second
     function updateTime() {
         ++seconds;
         document.getElementById("soFar").innerHTML = seconds;
     }
     //*******************************************************
     //The next functions are part of the game

     //Pass the cell number (1-16) to figure out if you can make
     // a move (it is possible if there is a neighboring empty cell)
     var moves = 0;
     function figureOutMove(r, c) {
         var validMove = false;

         //Save all the current td items into an Array
         fifteenPuzzle = new Array(4);  //Create an Array with 16 spots
         fifteenPuzzle[0] = new Array(4);
         fifteenPuzzle[1] = new Array(4);
         fifteenPuzzle[2] = new Array(4);
         fifteenPuzzle[3] = new Array(4);

         //Save all the items from the Table
         fifteenPuzzle[0][0] = document.getElementById("td1").innerHTML;
         fifteenPuzzle[0][1] = document.getElementById("td2").innerHTML;
         fifteenPuzzle[0][2] = document.getElementById("td3").innerHTML;
         fifteenPuzzle[0][3] = document.getElementById("td4").innerHTML;
         fifteenPuzzle[1][0] = document.getElementById("td5").innerHTML;
         fifteenPuzzle[1][1] = document.getElementById("td6").innerHTML;
         fifteenPuzzle[1][2] = document.getElementById("td7").innerHTML;
         fifteenPuzzle[1][3] = document.getElementById("td8").innerHTML;
         fifteenPuzzle[2][0] = document.getElementById("td9").innerHTML;
         fifteenPuzzle[2][1] = document.getElementById("td10").innerHTML;
         fifteenPuzzle[2][2] = document.getElementById("td11").innerHTML;
         fifteenPuzzle[2][3] = document.getElementById("td12").innerHTML;
         fifteenPuzzle[3][0] = document.getElementById("td13").innerHTML;
         fifteenPuzzle[3][1] = document.getElementById("td14").innerHTML;
         fifteenPuzzle[3][2] = document.getElementById("td15").innerHTML;
         fifteenPuzzle[3][3] = document.getElementById("td16").innerHTML;

         //Figure out which item is empty and if it is next to item that was clicked on
         //Cell below empty cell was clicked...
         if ((r - 1) >= 0) {
             if (fifteenPuzzle[r - 1][c] == "") {
                 var action = dynaTrace.enterAction("Move down", "click");
                 temp = fifteenPuzzle[r - 1][c];
                 fifteenPuzzle[r - 1][c] = fifteenPuzzle[r][c];
                 fifteenPuzzle[r][c] = temp;
                 ++moves;
                 dynaTrace.leaveAction(action);
             }
         }
         //Cell to the right of empty cell was clicked...
         if ((c - 1) >= 0) {
             if (fifteenPuzzle[r][c - 1] == "") {
                 var action = dynaTrace.enterAction("Move right", "click");
                 temp = fifteenPuzzle[r][c - 1];
                 fifteenPuzzle[r][c - 1] = fifteenPuzzle[r][c];
                 fifteenPuzzle[r][c] = temp;
                 ++moves;
                 dynaTrace.leaveAction(action);
             }
         }
         //Cell above empty cell was clicked...
         if ((r + 1) <= 3) {
             if (fifteenPuzzle[r + 1][c] == "") {
                 var action = dynaTrace.enterAction("Move up", "click");
                 temp = fifteenPuzzle[r + 1][c];
                 fifteenPuzzle[r + 1][c] = fifteenPuzzle[r][c];
                 fifteenPuzzle[r][c] = temp;
                 ++moves;
                 dynaTrace.leaveAction(action);
             }
         }
         //Cell to the left of empty cell was clicked...
         if ((c + 1) <= 3) {
             if (fifteenPuzzle[r][c + 1] == "") {
                 var action = dynaTrace.enterAction("Move left", "click");
                 temp = fifteenPuzzle[r][c + 1]; //save item clicked on
                 fifteenPuzzle[r][c + 1] = fifteenPuzzle[r][c];
                 fifteenPuzzle[r][c] = temp;
                 ++moves;
                 dynaTrace.leaveAction(action);
             }
         }

         if (fifteenPuzzle[0][0] == "") document.getElementById("td1").className = "empty";
         else document.getElementById("td1").className = "";
         document.getElementById("td1").innerHTML = fifteenPuzzle[0][0];

         if (fifteenPuzzle[0][1] == "") document.getElementById("td2").className = "empty";
         else document.getElementById("td2").className = "";
         document.getElementById("td2").innerHTML = fifteenPuzzle[0][1];

         if (fifteenPuzzle[0][2] == "") document.getElementById("td3").className = "empty";
         else document.getElementById("td3").className = "";
         document.getElementById("td3").innerHTML = fifteenPuzzle[0][2];

         if (fifteenPuzzle[0][3] == "") document.getElementById("td4").className = "empty";
         else document.getElementById("td4").className = "";
         document.getElementById("td4").innerHTML = fifteenPuzzle[0][3];

         if (fifteenPuzzle[1][0] == "") document.getElementById("td5").className = "empty";
         else document.getElementById("td5").className = "";
         document.getElementById("td5").innerHTML = fifteenPuzzle[1][0];

         if (fifteenPuzzle[1][1] == "") document.getElementById("td6").className = "empty";
         else document.getElementById("td6").className = "";
         document.getElementById("td6").innerHTML = fifteenPuzzle[1][1];

         if (fifteenPuzzle[1][2] == "") document.getElementById("td7").className = "empty";
         else document.getElementById("td7").className = "";
         document.getElementById("td7").innerHTML = fifteenPuzzle[1][2];

         if (fifteenPuzzle[1][3] == "") document.getElementById("td8").className = "empty";
         else document.getElementById("td8").className = "";
         document.getElementById("td8").innerHTML = fifteenPuzzle[1][3];

         if (fifteenPuzzle[2][0] == "") document.getElementById("td9").className = "empty";
         else document.getElementById("td9").className = "";
         document.getElementById("td9").innerHTML = fifteenPuzzle[2][0];

         if (fifteenPuzzle[2][1] == "") document.getElementById("td10").className = "empty";
         else document.getElementById("td10").className = "";
         document.getElementById("td10").innerHTML = fifteenPuzzle[2][1];

         if (fifteenPuzzle[2][2] == "") document.getElementById("td11").className = "empty";
         else document.getElementById("td11").className = "";
         document.getElementById("td11").innerHTML = fifteenPuzzle[2][2];

         if (fifteenPuzzle[2][3] == "") document.getElementById("td12").className = "empty";
         else document.getElementById("td12").className = "";
         document.getElementById("td12").innerHTML = fifteenPuzzle[2][3];

         if (fifteenPuzzle[3][0] == "") document.getElementById("td13").className = "empty";
         else document.getElementById("td13").className = "";
         document.getElementById("td13").innerHTML = fifteenPuzzle[3][0];

         if (fifteenPuzzle[3][1] == "") document.getElementById("td14").className = "empty";
         else document.getElementById("td14").className = "";
         document.getElementById("td14").innerHTML = fifteenPuzzle[3][1];

         if (fifteenPuzzle[3][2] == "") document.getElementById("td15").className = "empty";
         else document.getElementById("td15").className = "";
         document.getElementById("td15").innerHTML = fifteenPuzzle[3][2];

         if (fifteenPuzzle[3][3] == "") document.getElementById("td16").className = "empty";
         else document.getElementById("td16").className = "";
         document.getElementById("td16").innerHTML = fifteenPuzzle[3][3];

         //Update the move counter
         document.getElementById("moveCount").innerHTML = moves;

         //Check if you won
         checkWin();
     }
     //*******************************************************
     function checkWin() {
         var notYet = false; //determine if they won yet
         if (fifteenPuzzle[0][0] != 1) notYet = true;
         if (fifteenPuzzle[0][1] != 2) notYet = true;
         if (fifteenPuzzle[0][2] != 3) notYet = true;
         if (fifteenPuzzle[0][3] != 4) notYet = true;
         if (fifteenPuzzle[1][0] != 5) notYet = true;
         if (fifteenPuzzle[1][1] != 6) notYet = true;
         if (fifteenPuzzle[1][2] != 7) notYet = true;
         if (fifteenPuzzle[1][3] != 8) notYet = true;
         if (fifteenPuzzle[2][0] != 9) notYet = true;
         if (fifteenPuzzle[2][1] != 10) notYet = true;
         if (fifteenPuzzle[2][2] != 11) notYet = true;
         if (fifteenPuzzle[2][3] != 12) notYet = true;
         if (fifteenPuzzle[3][0] != 13) notYet = true;
         if (fifteenPuzzle[3][1] != 14) notYet = true;
         if (fifteenPuzzle[3][2] != 15) notYet = true;

         //Alert User if they won!
         if (notYet == false) {
             if (confirm("You Won! Play again?")) {
                 randomSwap(); //Didn't work...
             }
             else {
                 //Do nothing
             }
         }
     }
     //*******************************************************
     function startTrivialGame() {
         resetClockAndMoves();

         document.getElementById("td1").innerHTML = "1";
         document.getElementById("td1").className = "";
         document.getElementById("td2").innerHTML = "2";
         document.getElementById("td2").className = "";
         document.getElementById("td3").innerHTML = "3";
         document.getElementById("td3").className = "";
         document.getElementById("td4").innerHTML = "4";
         document.getElementById("td4").className = "";
         document.getElementById("td5").innerHTML = "5";
         document.getElementById("td5").className = "";
         document.getElementById("td6").innerHTML = "6";
         document.getElementById("td6").className = "";
         document.getElementById("td7").innerHTML = "7";
         document.getElementById("td7").className = "";
         document.getElementById("td8").innerHTML = "8";
         document.getElementById("td8").className = "";
         document.getElementById("td9").innerHTML = "9";
         document.getElementById("td9").className = "";
         document.getElementById("td10").innerHTML = "10";
         document.getElementById("td10").className = "";
         document.getElementById("td11").innerHTML = "11";
         document.getElementById("td11").className = "";
         document.getElementById("td12").innerHTML = "";
         document.getElementById("td12").className = "empty";
         document.getElementById("td13").innerHTML = "13";
         document.getElementById("td13").className = "";
         document.getElementById("td14").innerHTML = "14";
         document.getElementById("td14").className = "";
         document.getElementById("td15").innerHTML = "15";
         document.getElementById("td15").className = "";
         document.getElementById("td16").innerHTML = "12";
         document.getElementById("td16").className = "";
     }

     function startNewGame() {
         resetClockAndMoves();
         randomSwap();
     }

     function resetClockAndMoves() {
         //Update the move counter
         moves = 0;
         document.getElementById("moveCount").innerHTML = moves;

         //Reset the clock
         document.getElementById("soFar").innerHTML = 0;
         seconds = 0;
     }

     function randomSwap() {
         for (i = 0; i < 100; i++) {
             var r1 = Math.floor((Math.random() * 1024) % 16 + 1);
             var r2 = Math.floor((Math.random() * 1028) % 16 + 1);

             var firstElement = document.getElementById("td" + r1).innerHTML;
             var firstElementClass = document.getElementById("td" + r1).className;

             document.getElementById("td" + r1).innerHTML = document.getElementById("td" + r2).innerHTML;
             document.getElementById("td" + r1).className = document.getElementById("td" + r2).className;

             document.getElementById("td" + r2).innerHTML = firstElement;
             document.getElementById("td" + r2).className = firstElementClass;
         }
     }

 </script>

    <script type="text/javascript">
        startTimer();
        startNewGame();
    </script>

<h2 style="text-align: center;"><b>Fifteen Puzzle</b></h2>

<div align="center">
    <table class="FifteenPuzzle">
        <tr>
	        <td id="td1" onclick="figureOutMove(0,0);">1</td>
	        <td id="td2" onclick="figureOutMove(0,1);">2</td>
	        <td id="td3" onclick="figureOutMove(0,2);">3</td>
	        <td id="td4" onclick="figureOutMove(0,3);">4</td>
        </tr>
        <tr>
	        <td id="td5" onclick="figureOutMove(1,0);">5</td>
	        <td id="td6" onclick="figureOutMove(1,1);">6</td>
	        <td id="td7" onclick="figureOutMove(1,2);">7</td>
	        <td id="td8" onclick="figureOutMove(1,3);">8</td>
        </tr>
        <tr>
	        <td id="td9" onclick="figureOutMove(2,0);">9</td>
	        <td id="td10" onclick="figureOutMove(2,1);">10</td>
	        <td id="td11" onclick="figureOutMove(2,2);">11</td>
	        <td id="td12" onclick="figureOutMove(2,3);">12</td>
        </tr>
        <tr>
            <td id="td13" onclick="figureOutMove(3,0);">13</td>
            <td id="td14" onclick="figureOutMove(3,1);">14</td>
            <td id="td15" onclick="figureOutMove(3,2);">15</td>
            <td id="td16" onclick="figureOutMove(3,3);" class="empty"></td>
        </tr>
    </table>
</div>

<p style="text-align: center;"><button onclick="startNewGame()">Start New Game!</button></p>
<p style="text-align: center;"><button onclick="startTrivialGame()">Start Trivial Game!</button></p>
<p style="text-align: center;">How long it has taken you sor far to figure out this puzzle: <strong id="soFar">0</strong> seconds</p>
<p style="text-align: center;">How many moves you have made: <strong id="moveCount">0</strong></p>


</asp:Content>

