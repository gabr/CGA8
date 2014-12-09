
uniform vec4 Color;  // updated each draw call
uniform sampler2D Texture;
uniform sampler2D Texture_Night;
uniform sampler2D Texture_Normal;
 

in vec3 V;
in vec3 L; 
in vec2 TexCoord;


uniform vec4 LightSource;  // updated each draw call
 
void main() {
	    
gl_FragColor = Color;
							
	

}