/**
 * Created with IntelliJ IDEA.
 * User: filipesilvestrim
 * Date: 18/01/14
 * Time: 15:48
 * To change this template use File | Settings | File Templates.
 */
package {
public class View extends Messenger {

    private var _model : Object;

    public function get model ()                : Object    { return _model; }
    internal function setModel (value : Object) : void      { _model = value; }

    public function View(model:Object = null) {
        _model = model;
    }
}
}
