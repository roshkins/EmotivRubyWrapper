require 'ffi'

module EmotivNative
  extend FFI::Library
  EDK_OK = 0
  ffi_lib "./ext/libedk.so"
  #= FFI::Library 
  #This is an internal SDK of the functions. It's not reccomended that you use
  # this directly. Instead, use the EmotivSDK itself.
  
  # Notice that EE_EngineRemoteConnect has 3 parameters while the SDK docs lists
  # two. Thats because there was a segfault when that wasn't filled in with a
  # developer id for the last parameter.
  attach_function :EE_EngineRemoteConnect, [:string, :ushort, :string], :int
  attach_function :EE_EngineConnect, [:string], :int
  attach_function :EE_EngineDisconnect, [], :int
  attach_function
end

module EmotivSDK
  class Engine   
    include EmotivNative
    def initialize(simulator = false)
      if simulator      
        puts self.EE_EngineRemoteConnect("127.0.0.1", 1726, "Emotiv Systems-5")
      else
         puts self.EE_EngineConnect "Emotiv Systems-5"
      end
    end 
  end
end

puts EmotivSDK::Engine.new(true)