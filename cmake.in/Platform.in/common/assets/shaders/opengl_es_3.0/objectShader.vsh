#version 100
attribute vec4 inPosition;
attribute vec2 inTexCoord;
attribute vec4 inColor;
attribute mat4 inTransform;
attribute float inOpacity;
attribute float inHidden;
attribute mat4 inColorTransform;
varying vec4 destinationColor;
varying vec2 destinationTexCoord2D;
varying float destinationOpacity;
varying float destinationHidden;
varying mat4 destinationColorTransform;
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

