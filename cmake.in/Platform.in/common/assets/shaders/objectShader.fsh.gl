varying vec4 destinationColor;
varying vec2 destinationTexCoord2D;
varying float destinationOpacity;
varying float destinationHidden;
varying mat4 destinationColorTransform;
uniform sampler2D diffuseTexture2D;
uniform int u_opacityModifyRGB;
void main ()
{
  vec4 color_1;
  vec4 tmpvar_2;
  tmpvar_2.xyz = vec3(1.0, 1.0, 1.0);
  tmpvar_2.w = destinationOpacity;
  if ((destinationHidden != 0.0)) {
    discard;
  };
  color_1 = destinationColor;
  vec4 tmpvar_3;
  tmpvar_3 = texture2D (diffuseTexture2D, destinationTexCoord2D);
  if ((u_opacityModifyRGB == 1)) {
    vec4 tmpvar_4;
    tmpvar_4.x = (destinationColor.x * destinationColor.w);
    tmpvar_4.y = (destinationColor.y * destinationColor.w);
    tmpvar_4.z = (destinationColor.z * destinationColor.w);
    tmpvar_4.w = destinationColor.w;
    color_1 = tmpvar_4;
  };
  color_1 = ((color_1 * tmpvar_3) * tmpvar_2);
  vec4 tmpvar_5;
  tmpvar_5.x = (((
    (color_1.x * destinationColorTransform[0].x)
   + 
    (color_1.y * destinationColorTransform[1].x)
  ) + (color_1.z * destinationColorTransform[2].x)) + destinationColorTransform[3].x);
  tmpvar_5.y = (((
    (color_1.x * destinationColorTransform[0].y)
   + 
    (color_1.y * destinationColorTransform[1].y)
  ) + (color_1.z * destinationColorTransform[2].y)) + destinationColorTransform[3].y);
  tmpvar_5.z = (((
    (color_1.x * destinationColorTransform[0].z)
   + 
    (color_1.y * destinationColorTransform[1].z)
  ) + (color_1.z * destinationColorTransform[2].z)) + destinationColorTransform[3].z);
  tmpvar_5.w = color_1.w;
  vec4 tmpvar_6;
  tmpvar_6 = clamp (tmpvar_5, 0.0, 1.0);
  color_1 = tmpvar_6;
  if ((tmpvar_6.w == 0.0)) {
    discard;
  };
  gl_FragColor = tmpvar_6;
}

