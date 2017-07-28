// INSPIRED BY SEB KAY'S 'SIGN UP FORM'
// https://dribbble.com/shots/1776663-Purple-Sign-Up-Form
// https://dribbble.com/shots/1779149--Free-PSD-Purple-Sign-Up-Form-Payment-Details

// DO YOU HAVE A SPARE DRIBBBLE INVITE? I'D	APPRECIATE IT!
// dribbble.com/josec
$(document).ready(function(){
    $('.log-btn').click(function(){
        $('.log-status').addClass('wrong-entry');
        $('.alert').fadeIn(500);
        setTimeout( "$('.alert').fadeOut(1500);",3000 );
    });
    $('.form-control').keypress(function(){
        $('.log-status').removeClass('wrong-entry');
    });

});




function addoperator() {
    var a1=document.getElementById("addoperator");
    document.getElementById("main").style.display="none";
    document.getElementById("addvehicle").style.display="none";
    document.getElementById("removevehicle").style.display="none";
    document.getElementById("addsparepart").style.display="none";
    document.getElementById("removesparepart").style.display="none";
    document.getElementById("removeoperator").style.display="none";
    document.getElementById("main").innerHTML=document.getElementById("addoperator").innerHTML;
    a1.style.display="block";
}
function removeoperator() {
    document.getElementById("main").style.display="none";
    document.getElementById("addoperator").style.display="none";
    document.getElementById("addvehicle").style.display="none";
    document.getElementById("removevehicle").style.display="none";
    document.getElementById("addsparepart").style.display="none";
    document.getElementById("removesparepart").style.display="none";
    var a2=document.getElementById("removeoperator");
    document.getElementById("main").innerHTML=document.getElementById("removeoperator").innerHTML;
    a2.style.display="block";
}

function addvehicle() {
    document.getElementById("main").style.display="none";
    document.getElementById("addoperator").style.display="none";
    document.getElementById("removeoperator").style.display="none";
    document.getElementById("removevehicle").style.display="none";
    document.getElementById("addsparepart").style.display="none";
    document.getElementById("removesparepart").style.display="none";
    var a1=document.getElementById("addvehicle");
    document.getElementById("main").innerHTML=document.getElementById("removeoperator").innerHTML;
    a1.style.display="block";
}
function removevehicle() {
    document.getElementById("main").style.display="none";
    document.getElementById("addoperator").style.display="none";
    document.getElementById("removeoperator").style.display="none";
    document.getElementById("addvehicle").style.display="none";
    document.getElementById("addsparepart").style.display="none";
    document.getElementById("removesparepart").style.display="none";
    var a1=document.getElementById("removevehicle");
    document.getElementById("main").innerHTML=document.getElementById("removeoperator").innerHTML;
    a1.style.display="block";
}
function addsparepart() {
    document.getElementById("main").style.display="none";
    document.getElementById("addoperator").style.display="none";
    document.getElementById("removeoperator").style.display="none";
    document.getElementById("removevehicle").style.display="none";
    document.getElementById("addvehicle").style.display="none";
    document.getElementById("removesparepart").style.display="none";
    var a1=document.getElementById("addsparepart");
    document.getElementById("main").innerHTML=document.getElementById("removeoperator").innerHTML;
    a1.style.display="block";
}
function removesparepart() {
    document.getElementById("main").style.display="none";
    document.getElementById("addoperator").style.display="none";
    document.getElementById("removeoperator").style.display="none";
    document.getElementById("removevehicle").style.display="none";
    document.getElementById("addsparepart").style.display="none";
    document.getElementById("addvehicle").style.display="none";
    var a1=document.getElementById("removesparepart");
    document.getElementById("main").innerHTML=document.getElementById("removeoperator").innerHTML;
    a1.style.display="block";
}
function addvehiclestock() {
    document.getElementById("main1").style.display="none";
    document.getElementById("removevehiclestock1").style.display="none";
    document.getElementById("addsparepartstock2").style.display="none";
    document.getElementById("removesparepartstock2").style.display="none";
    var a1=document.getElementById("addvehiclestock1");
    document.getElementById("main1").innerHTML=document.getElementById("addvehiclestock1").innerHTML;
    a1.style.display="block";
}
function removevehiclestock() {
    document.getElementById("main1").style.display="none";
    document.getElementById("addvehiclestock1").style.display="none";
    document.getElementById("addsparepartstock2").style.display="none";
    document.getElementById("removesparepartstock2").style.display="none";
    var a2=document.getElementById("removevehiclestock1");
    document.getElementById("main1").innerHTML=document.getElementById("removevehiclestock1").innerHTML;
    a2.style.display="block";
}
function addsparepartstock() {
    document.getElementById("main1").style.display="none";
    document.getElementById("removevehiclestock1").style.display="none";
    document.getElementById("addvehiclestock2").style.display="none";
    document.getElementById("removesparepartstock2").style.display="none";
    var a3=document.getElementById("addsparepartstock2");
    document.getElementById("main1").innerHTML=document.getElementById("addsparepartstock2").innerHTML;
    a3.style.display="block";
}
function removesparepartstock() {
    document.getElementById("main1").style.display="none";
    document.getElementById("addvehiclestock1").style.display="none";
    document.getElementById("addsparepartstock2").style.display="none";
    document.getElementById("removevehiclestock1").style.display="none";
    var a4=document.getElementById("removesparepartstock2");
    document.getElementById("main1").innerHTML=document.getElementById("removesparepartstock2").innerHTML;
    a4.style.display="block";
}