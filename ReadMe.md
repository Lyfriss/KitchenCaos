# Kitchen Chaos
## Objective:
My objective is to follow the [curse](https://www.youtube.com/watch?v=AmGSEH7QcDg&t=4960s) made by [Codemonkey](https://www.youtube.com/@CodeMonkeyUnity) to learn how to create a "professional" game.

**I will not be using Unity like Codemonkey**, instead **I will use Godot 4.4.1**. I will do my best to translate from Unity to Godot. This ReadMe will work as a type of ***journal***.

Another important note is that I will be using **GDscript** and not **C#**, although it is possible to use C# in Godot. I have chosen to use GDscript for personal reasons.

## Index: 

* [Post processing](#post-processing)
* [Player](#player)
* [Animations](#animations)
* [Cinemachine](#cinemachine)
* [Refractor](#refractor)
* [Collision](#collision)
* [Clear Counter](#clear-counter)
  
	-[Interactions](#interactions)

## Preparation:
The preparations consisted of:
1) Creating the Godot project
2) Configuring VSCode
3) Configuring GitHub

Unfortunately, the curse does not have a section for GitHub.

## Assets:
The assets provided by Code Monkey were not used in this project. Instead, the **[KayKit : Restaurant Bits](https://kaylousberg.itch.io/restaurant-bits)** asset pack created by **[Kay Lousberg](https://kaylousberg.itch.io/)** was used as a substitute.

# Post processing <a name = "post-processing" ></a>

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

# Player: <a name = "player"></a>

Thanks to Godot's node structure, maintaining the separation between a player's logic and visual elements is straightforward.

![Player structure](Docs/PlayerStructure.png)

I've recreated the look of the player using simple spheres 

## Player movement: 
Implementing player movement in Godot was straightforward.
All that was needed was to toggle jumping and gravity from the template.
Unfortunately, there is no obfuscation in GDScript (to my knowledge)

# Animations: <a name = "animations"> </a>
I used **Animation Player** to create the *Idle* and *Walk* animations, playing them based on the condition:

	@export var player: Player
	@export var animation_player: AnimationPlayer

	func _process(_delta):
		if player.velocity.x != 0 || player.velocity.z != 0:
			animation_player.play("Walk")
		else:
			animation_player.play("Idle")

What wasn't straightforward was rotating the player.
In Unity, all Codemonkey needed to do was:
	
	float rotateSpeed = 10;
	transform.foward = Vector3.lerp(transform.foward, moveDir, Time.deltaTime * rotateSpeed);

With a lot of trial and error i replicate the effect with: 

	if direction:
		var rotate_speed : float = 10
		var target_basis := Basis(Vector3(0, 1, 0), atan2(direction.x, direction.z))
		set_basis(basis.slerp(target_basis, rotate_speed * delta))



# Cinemachine: <a name = "cinemachine"> </a> 
In this section, CodeMonkey showcases Cinemachine, which is the equivalent of Godot's **Phantom Camera**. However, I will skip this section regardless.

# Refractor: <a name = "refractor"></a>

Although there is no *NewInputSystem* in Godot, I still created a **GameInput** node and refractored the input

	extends Node
	class_name GameInput

	func get_player_movement_vector() -> Vector2:
		return Vector2(Input.get_vector("Move_Left", "Move_Right", "Move_Up", "Move_Down"))

# Collision: <a name = "collision"></a>

CharacterBody3d handles collion on it's own, skip

# Clear counter: <a name = "clear-counter"></a>

To enable collisions, I had to use a **StaticBody3D** as the parent node.

![alt text](Docs/ClearCounterStructure.png)

## Interactions: <a name = "interactions"></a>

Godot has by default an **raycast3D** node
