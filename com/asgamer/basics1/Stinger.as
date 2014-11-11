

package com.asgamer.basics1
{
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class Stinger extends MovieClip
	{
		
		private var stageRef:Stage;
		private var vy:Number = 3;
		private var ay:Number = .4;
		private var target:Ship;
		
		public function Stinger(stageRef:Stage, target:Ship) : void
		{
			this.stageRef = stageRef;
			this.target = target;
			
			x = Math.random() * stageRef.stageWidth;
			y = -5;
			
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		}
		
		private function loop(e:Event) : void
		{
			vy += ay;
			y += vy;
			
			if (y > stageRef.stageHeight)
				removeSelf();
		}
		
		private function removeSelf() : void {
			
			removeEventListener(Event.ENTER_FRAME, loop);
			
			if (stageRef.contains(this))
				stageRef.removeChild(this);
		}
		
	}
	
}

