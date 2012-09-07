var gl;
/*
var jgl;

document.write("loaded");

function jglCreateContext(canvas) 
{
    try 
    {
      gl = canvas.getContext("experimental-webgl");
      this.width = canvas.width;
      this.height = canvas.height;
    }
    catch(e) 
    {
    
    }
    if(!gl) 
    {
      alert("No WebGL implementation available :(");
    }
}

function window
{
	this.createContext=jglCreateContext;
}
*/
function render()
{
	gl.clearColor(1.0, 0.5, 0.0, 1.0);
	gl.clear(gl.COLOR_BUFFER_BIT);
}

function main()
{
	var canvas = document.getElementById("canvas");
	gl = canvas.getContext('experimental-webgl');
	//jgl = new window;
	//gl = jgl.createContext(canvas);

	setInterval(render, 15);
}
