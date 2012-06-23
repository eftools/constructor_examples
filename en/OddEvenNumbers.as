package
{
	import flash.display.Bitmap;
	import inobr.eft.constructor.core.Area;
	import inobr.eft.constructor.core.ConstructorWorkspace;
	import inobr.eft.constructor.core.DragObject;
	import inobr.eft.constructor.core.Initializer;
	import inobr.eft.constructor.core.StackableArea;
	import inobr.eft.constructor.lang.en;
	
	/**
	 * ...
	 * @author Peter Gerasimenko, gpstmp@gmail.com
	 */
	[SWF(width = "500", height = "460", frameRate = "40", backgroundColor = "#2581C0")]
	public class OddEvenNumbers extends Initializer
	{
		[Embed(source="formulation.png")]
		private var Formulation:Class;
		
		override protected function initialize():void
		{
			// add formulation of the task
			var formulation:Bitmap = new Formulation();
			addChild(formulation);
			
			// set the language parameter of the constructor workspace
			var workspace:ConstructorWorkspace = new ConstructorWorkspace(en);
			
			// create standart drag objects
			var dragObject_1:DragObject = new DragObject("100", 100, 50);
			var dragObject_2:DragObject = new DragObject("55", 120);
			var dragObject_3:DragObject = new DragObject("44,5", 200, 60);
			var dragObject_4:DragObject = new DragObject("10");
			var dragObject_5:DragObject = new DragObject("11", 100, 60);
			var dragObject_6:DragObject = new DragObject("13,1", 80, 80);
			
			// create and configure areas for placing drag objects
			var homeArea:Area = new StackableArea(10, 10, 480, 160);
			homeArea.setInitialDragObjects(dragObject_1, dragObject_3, dragObject_2, dragObject_4, dragObject_5, dragObject_6);
			homeArea.rightOrder = [dragObject_3, dragObject_6];
			
			var oddArea:Area = new StackableArea(10, 200, 480, 90);
			oddArea.rightOrder = [dragObject_2, dragObject_5];
			
			var evenArea:Area = new StackableArea(10, 320, 480, 90);
			// need to verify the order of the objects
			evenArea.rightOrder = [dragObject_1, dragObject_4];
			evenArea.isSequenceImportant = true;
			
			workspace.addArea(homeArea, oddArea, evenArea);
			
			// visualize workspace
			addChild(workspace);
		}
	}
}