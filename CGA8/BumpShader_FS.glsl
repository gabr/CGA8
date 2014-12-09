// Arkadiusz Gabrys qe83mepi
// Agnieszka Zacher by57zeja

#version 330

uniform vec4 Color;  // updated each draw call
uniform sampler2D Texture;
uniform sampler2D Mask;
uniform sampler2D Texture_Night;
//uniform sampler2D Texture_Normal;

in vec3 V;
//in vec3 L; 
in vec3 N;
in vec2 TexCoord;

uniform vec4 LightSource;  // updated each draw call
 
void main() {
	// textures affect diffuse lighting only
	// only water should produce specular hightlights

    vec3 L = normalize(LightSource.xyz - V);
    vec3 E = normalize(V);
    vec3 R = reflect(L, N);

    // ambient from texture
    vec4 ambient = texture2D(Texture, TexCoord);
    vec4 mask = texture2D(Mask, TexCoord);

    // diff
    float dotPr = dot(N, L);
    if (dotPr < 0.0)
    {
        dotPr = 0.0;
    }
    vec4 diff = ambient * dotPr;

    // spec
    float s = 10;
    dotPr = dot(E, R);
    if (dotPr < 0.0)
    {
        dotPr = 0.0;
    }

    vec4 spec = vec4(1.0) * pow(dotPr, s);

    vec4 color =  diff; // no ambient for plantes

    if (mask.x > 0.0)
    {
        color += 0.5 * spec;
    }

    gl_FragColor = color;

}