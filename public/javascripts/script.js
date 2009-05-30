/*
© StudioDAS, Saint-Petersburg, 2009
Made by liubov nelapa
*/

var num;

function makeVisible(link)
{
    link.style.display = "inline-block";
    link.getElementsByTagName('img')[0].style.display = "block";
}

function makeInvisible(link)
{
    link.style.display = "none";
    link.getElementsByTagName('img')[0].style.display = "none";
}
    
function move(sect,flag){
    section = document.getElementById(sect).getElementsByTagName('a');
    if (section.length<7) return;
    num=section.length;
    for (i=0; i<section.length; i++){
        if (section[i].style.display.toString() != 'none'){
            num=i; break;
        }
    };
    if (flag!='back'){
        if (num+6<section.length){
            makeInvisible(section[num]);
            makeVisible(section[num+6]);
        }
        else{
            for (j=0; j<6; j++){
                makeInvisible(section[num+j]);
                makeVisible(section[j]);
            }
        }
    }
    else {
        if (num>0){
            makeInvisible(section[num+5]);
            makeVisible(section[num-1]);
        }
        else{
            for (j=0; j<6; j++){
                makeInvisible(section[j]);
            }
            for (j=0; j<6; j++){
                makeVisible(section[section.length-j-1]);
            }
        }
    }
}

function changeProjectImage(flag){
    section = document.getElementById("projectImg").getElementsByTagName('img');
    if (section.length==1) return;
    num=section.length;
    for (i=0; i<section.length; i++){
        if (section[i].style.display.toString() != 'none'){
            num=i; break;
        }
    };
    if (flag!='back'){
        if (num<section.length-1){
            section[num].style.display='none'
            section[num+1].style.display = 'block';
        }
        else{
            section[num].style.display='none';
            section[0].style.display = 'block';
        }
    }
    else {
        if (num>0){
            section[num].style.display='none';
            section[num-1].style.display = 'block';
        }
        else{
            section[0].style.display='none';
            section[section.length-1].style.display = 'block';
        }
    }
}

function wheelInitialize(){
    if (document.getElementById('projectImg').addEventListener)
    {
        document.getElementById('projectImg').addEventListener('DOMMouseScroll', wheel, false);
    }
    else
    {
       document.getElementById('projectImg').onmousewheel = wheel;
    }
}

function wheel(event)
{
    var wheelDelta = 0;
    
    var step = 300;
    if (!event) 
    {
        event = window.event;
    }
    if (event.wheelDelta) 
    {
        wheelDelta = event.wheelDelta/120;
    } 
    else if (event.detail) 
    {
        wheelDelta = -event.detail/3;
    }
    if (wheelDelta)
    {
        if (wheelDelta>0)changeProjectImage("back");
        else changeProjectImage("forward");
    }
    
    if (event.preventDefault)
    {
        event.preventDefault();
    }
    event.returnValue = false;
    //blockEvent(event);
}



