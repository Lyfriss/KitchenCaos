# Kitchen Chaos
## Objective:
My objective is to follow the [curse](https://www.youtube.com/watch?v=AmGSEH7QcDg&t=4960s) made by [Codemonkey](https://www.youtube.com/@CodeMonkeyUnity) to learn how to create a "professional" game.

**I will not be using Unity like Codemonkey**, instead **I will use Godot 4.4.1**. I will do my best to translate from Unity to Godot. This ReadMe will work as a type of ***journal***.

Another important note is that I will be using **GDscript** and not **C#**, although it is possible to use C# in Godot. I have chosen to use GDscript for personal reasons.

## Preparation:
The preparations consisted of:
1) Creating the Godot project
2) Configuring VSCode
3) Configuring GitHub

Unfortunately, the curse does not have a section for GitHub.

## Assets:
The assets provided by Code Monkey were not used in this project. Instead, the **[KayKit : Restaurant Bits](https://kaylousberg.itch.io/restaurant-bits)** asset pack created by **[Kay Lousberg](https://kaylousberg.itch.io/)** was used as a substitute.

# Post processing 

## Settings used in the curse:
### Unity settings:
	* Tonemapping: Neutral
	* Contrast: 20
	* Saturation: 20
	* Bloom Threshold: 0.95
	* Bloom Intensity: 1
	* Vignette Intensity: 0.25
	* Vignette Smoothness: 0.4
	* Anti-aliasing (MSAA): 8x
	* Screen space ambient occlusion (SSAO): 
		+ Intensity: 4
		+ Radius: 0.3
		+ Falloff distance: 100
		+ Direct lighting distance: 1
### Godot settings:
	* Tonemapping: Filmic
	* Contrast: 1.2
	* Saturation: 1.2
	* Bloom: 0.95
	* Blend mode: mix
	* Anti-aliasing (MSAA): 8x
	* Screen space ambient occlusion (SSAO): 
		+ Intensity: 4
		+ Radius: 0.3

To note, Godot does not have a vignette by default.

## Camera settings:
### Unity settings:
	* Position: 0, 21.5, -21.3
	* Rotation: 46, 0, 0
	* Fov: 20
### Godot settings: 
	* Position: 0, 21.5, 21.3
	* Rotation: -46, 0, 0
	* Fov: 20

# Player:

Thanks to Godot's node structure, maintaining the separation between a player's logic and visual elements is straightforward.

- Create a CharacterBody3D as the root node
- Add a CollisionShape3D and use a cylinder as the player's collision shape
- Add a MeshInstance3D for the player's visual representation (for now)

## Player movement: 
Implementing the movement in Godot was straightforward.
All that was needed was to toggle jumping and gravity from the template.

Unfortunatly in GDscript there is no obfuscation (in my knowledge)

