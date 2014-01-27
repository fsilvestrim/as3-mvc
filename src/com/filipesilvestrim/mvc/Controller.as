/**
 * Created with IntelliJ IDEA.
 * User: filipesilvestrim
 * Date: 18/01/14
 * Time: 15:46
 * To change this template use File | Settings | File Templates.
 */
package com.filipesilvestrim.mvc {
public class Controller extends Messenger {
    private var _view   : View;
    private var _model  : Object;

    protected function get view ()  : View  { return _view; }
    protected function get model () : Object{ return _model; }

    public function Controller(view:View = null, model:Object = null) {
        _view = view;
        _model = model;
    }

    override public function dispose () : void{
        _view = null;
        _model = null;
        super.dispose();
    }
}
}
