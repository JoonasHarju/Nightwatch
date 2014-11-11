

package com.asgamer.basics1
{
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class StingerBullet extends MovieClip
	{
		
		private var stageRef:Stage;
		private var target:Ship;
		
		private var vx:Number;
		
		public function StingerBullet(stageRef:Stage, target:Ship, x:Number, y:Number, vx:Number) : void
		{
			this.stageRef = stageRef;
			this.target = target;
			this.x = x;
			this.y = y;
			this.vx = vx;
			
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
		}
		
		private function loop(e:Event) : void
		{
			x += vx;
			
			if (y - 15 < target.y && y + 15 > target.y)
				fireWeapon();
			if (x > stageRef.stageWidth || x < 0)
				removeSelf();
			
		}
		private function fireWeapon() : void
		{
			stageRef.addChild(new StingerBullet(stageRef, target, x, y, -5));
			stageRef.addChild(new StingerBullet(stageRef, target, x, y, 5));
		}
		
		private function removeSelf() : void
		{
			if (stageRef.contains(this))
				stageRef.removeChild(this);
		}
		
		
	}
	
}

