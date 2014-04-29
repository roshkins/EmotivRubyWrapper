#include "ruby.h"
#include <stdio.h>
#include "edk.h"

void Init_Emotiv();

VALUE Emotiv_initialize(VALUE);
VALUE Emotiv_new(VALUE, VALUE);
void Emotiv_free();

VALUE EngineEvent_new(VALUE);
VALUE EngineEvent_initialize(VALUE);

void Init_Emotiv() {
    
    //Define EmotivSensor class
    VALUE cEmotiv = rb_define_class("EmotivSensor\0", rb_cObject);
    rb_define_singleton_method(cEmotiv,"new\0", Emotiv_new, 1);
    rb_define_method(cEmotiv, "initialize\0", Emotiv_initialize, 0);
    
    //Define EngineEvent class
    //VALUE cEngineEvent = rb_define_class("EngineEvent", rb_cObject);
    //rb_define_singleton_method(cEngineEvent, "EngineEvent",EngineEvent_new, 0);
    //rb_define_method(cEngineEvent, "initialize", EngineEvent_initialize, 0);
    
    
}

/**
 * Allocates memory for a new Emotiv class.
 * @param class
 * self
 * @param boolComposer
 * True if using Composer, false if using hardware
 * @return 
 */
VALUE Emotiv_new(VALUE class, VALUE boolComposer){
    VALUE info; 
    VALUE eConnection;
    
    eConnection = rb_define_class("ConnectionError\0", rb_eException );
    if (EE_EngineConnect("Emotiv Systems-5\0") != EDK_OK){
            rb_raise(eConnection, "Connection not established.");
            return Qnil;
    }
    if (boolComposer == Qtrue){
        unsigned short port = 1726;
        const char* szHost = "127.0.0.1\0";
        int error = EE_EngineRemoteConnect(szHost, port);
       if ( error != EDK_OK){
           rb_raise(eConnection, "Remote Connection not established.");
           printf("Error code: %2d", error);
           return Qnil;
       }
    }
 
    
    info = Data_Wrap_Struct(class, 0, Emotiv_free, 0);
    rb_obj_call_init(info, 0, 0);
    return info;
}

void Emotiv_free(){
    EE_EngineDisconnect();
}

VALUE Emotiv_initialize(VALUE self){

    //rb_funcall(rb_mKernel, rb_intern("puts"), 1, rb_str_new2("Emotiv inititalized.\0"));
    
    return self;
}

