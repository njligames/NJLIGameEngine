

in vec4 inPosition;
in vec2 inTexCoord;
in vec4 inColor;
in mat4 inTransform;
in float inOpacity;
in float inHidden;
in mat4 inColorTransform;
out vec4 destinationColor;
out vec2 destinationTexCoord2D;
out float destinationOpacity;
out float destinationHidden;
out mat4 destinationColorTransform;
uniform mat4 modelView;
uniform mat4 projection;
void main ()
{
    destinationColor = inColor;
    destinationTexCoord2D = inTexCoord;
    destinationOpacity = inOpacity;
    destinationHidden = inHidden;
    destinationColorTransform = inColorTransform;
    gl_Position = (((projection * modelView) * inTransform) * inPosition);
}

