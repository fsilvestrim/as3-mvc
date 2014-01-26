/**
 * Created with IntelliJ IDEA.
 * User: filipesilvestrim
 * Date: 18/01/14
 * Time: 15:54
 * To change this template use File | Settings | File Templates.
 */
package {

/**
 * This is the connection pipe class.
 */
internal class Messenger implements IMVC {
    protected var facade : Facade = Facade.facade;

    protected function get listening() : Array { return []; }

    public function Messenger() { facade.add(AS3::execute); }

    /**
     * Execute all the messaging
     * @param msgName
     * @param msgBody
     */
    final AS3 function execute(msgName:String, msgBody:Object) : void {
        if(listening.indexOf(msgName)!=-1) protected::execute(msgName, msgBody);
    }

    protected function execute(msgName:String, msgBody:Object) : void {}

    final protected function sendMessage(msgName:String, msgBody:Object = null) : void {
        facade.dispatch(msgName, msgBody);
    }

    public function register():void {  }
    public function dispose():void { facade.remove(AS3::execute); }
}
}