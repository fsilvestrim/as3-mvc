/**
 * Created with IntelliJ IDEA.
 * User: filipesilvestrim
 * Date: 18/01/14
 * Time: 15:43
 * To change this template use File | Settings | File Templates.
 */
package {
import flash.utils.Dictionary;

import org.osflash.signals.Signal;

/**
 * Facade pattern approach for the messaging.
 */
public class Facade extends Signal {
    public var map : Dictionary = new Dictionary(true);

    static internal var facade : Facade = new Facade();

    public function Facade() {
        super(String, Object);
        if(facade) throw new Error("SINGLETON!!!");
    }

    public function retrieve(clazz:Class) : IMVC { return map[clazz]; }

    static public function addTriad(m:Class, v:Class, c:Class, mr:*=null, vr:*=null, cr:*=null):void {
        add(m, mr ||= new m());
        add(v, vr ||= new v(mr));
        add(c, cr ||= new c(vr,mr));
    }

    static public function add(value:Class, ref:*=null):void {
        facade.map[value] = ref || new value();

        IFDEF::dev {
            if(!(facade.map[value] is IMVC))
                throw new Error('The MVC Class ' + value + ' MUST implement IMVC!');
        }

        (facade.map[value] as IMVC).register();
    }

    static public function remove(...classes):void {
        for each (var clazz:Class in classes){
            (facade.map[clazz] as IMVC).dispose();
            delete facade.map[clazz];
        }
    }
}
}
