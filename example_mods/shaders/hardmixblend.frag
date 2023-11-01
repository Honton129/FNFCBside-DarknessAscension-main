#pragma header

void main()
{
	vec3 partA = texture2D(sceneTexture, texcoord);
	vec3 partB = texture2D(lightTexture, texcoord);
	vec3 line1 = 2.0 * partA * partB;
	vec3 line2 = 1.0 - (1.0 - partA) * (1.0 - partB);
	gl_FragCoord = vec4(mix(line2, line1, step(0.5, partA)), 1);
}