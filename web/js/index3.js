
function buycar() {
    document.getElementById("main1").style.display="none";
    document.getElementById("servicecar").style.display="none";
    var a1=document.getElementById("buycar");
    document.getElementById("main1").innerHTML=document.getElementById("buycar").innerHTML;
    a1.style.display="block";
}
function servicecar() {
    document.getElementById("main1").style.display="none";
    document.getElementById("buycar").style.display="none";
    var a2=document.getElementById("servicecar");
    document.getElementById("main1").innerHTML=document.getElementById("servicecar").innerHTML;
    a2.style.display="block";
}
