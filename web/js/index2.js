
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
    document.getElementById("addvehiclestock1").style.display="none";
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