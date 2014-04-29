require 'ffi'

module EmotivSDK
  extend FFI::Library
  EDK_OK = 0
  ffi_lib "./ext/libedk.so"
  attach_function :EE_EngineRemoteConnect, [:string, :ushort], :int
  attach_function :EE_EngineConnect, [:string], :int
  attach_function :EE_EngineDisconnect, [], :int
  
  class Engine 
  
  def self.setupengine(simulator = false)
    self.EE_EngineConnect "Emotiv Systems-5"
    if simulator      
      self.EE_EngineRemoteConnect("127.0.0.1", 1726)
    end
  end
  
end

EmotivSDK.setupengine(true)