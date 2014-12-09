 #version 330

 
layout(location = 0) in vec4 vPosition;
layout(location = 1) in vec4 vNormal;
layout(location = 2) in vec4 vTex;
layout(location = 3) in vec4 vTangent;

uniform mat4 MVP;  // updated each draw call
uniform mat4 MV;  // updated each draw call 
uniform mat3 NormalMatrix;  // updated each draw call
 
uniform vec4 LightSource;  // updated each draw call


out vec3 V;
out vec3 L;
out vec2 TexCoord;


void main() {


	gl_Position =   MVP*vPosition;

}