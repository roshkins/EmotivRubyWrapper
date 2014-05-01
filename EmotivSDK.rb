require 'ffi'

module EmotivNative
  extend FFI::Library
  EDK_OK = 0
  EDK_NO_EVENT = 0x0600
  
  ffi_lib "./ext/libedk.so"
  
  #= EmotivNative
  # This is an internal SDK of the functions. It's not recommended that you use
  # this directly. Instead, use the EmotivSDK itself.
  # this is an ffi of EDK.h
  
  enum :EE_ExpressivThreshold_t, [:EXP_SENSITIVITY]
  enum :EE_ExpressivTrainingControl_t, [ :EXP_NONE,  0,
                                            :EXP_START, 
                                            :EXP_ACCEPT,
                                            :EXP_REJECT, 
                                            :EXP_ERASE, 
                                            :EXP_RESET  ]
  enum :EE_ExpressivSignature_t, [ :EXP_SIG_UNIVERSAL,  0,
                                   :EXP_SIG_TRAINED ]
  enum :EE_CognitivTrainingControl_t, [ :COG_NONE, 0,
                                        :COG_START, 
                                        :COG_ACCEPT, 
                                        :COG_REJECT, 
                                        :COG_ERASE, 
                                        :COG_RESET  ]
  typedef :pointer, :EmoStateHandle
  typedef :pointer, :EmoEngineEventHandle
  typedef :pointer, :OptimizationParamHandle
  typedef :pointer, :DataHandle
  
  enum :EE_Event_t, [ :EE_UnknownEvent,   0x0000,
                      :EE_EmulatorError,  0x0001,
                      :EE_ReservedEvent,  0x0002,
                      :EE_UserAdded,      0x0010,
                      :EE_UserRemoved,    0x0020,
                      :EE_EmoStateUpdated,0x0040,
                      :EE_ProfileEvent,   0x0080,
                      :EE_CognitivEvent,  0x0100,
                      :EE_ExpressivEvent, 0x0200,
                      :EE_InternalStateChanged, 0x0400,
                      :EE_AllEvent,       (0x0010 | 0x0020 | 0x0040 | 0x0080 |
							  0x0100 | 0x0200 | 0x0400)]
  enum :EE_ExpressivEvent_t, [  :EE_ExpressivNoEvent, 0,
                                :EE_ExpressivTrainingStarted, 
                                :EE_ExpressivTrainingSucceeded,
                                :EE_ExpressivTrainingFailed, 
                                :EE_ExpressivTrainingCompleted, 
                                :EE_ExpressivTrainingDataErased,
                                :EE_ExpressivTrainingRejected, 
                                :EE_ExpressivTrainingReset  ]
   
  enum :EE_CognitivEvent_t, [ :EE_CognitivNoEvent,  0, 
                              :EE_CognitivTrainingStarted, 
                              :EE_CognitivTrainingSucceeded,
                              :EE_CognitivTrainingFailed, 
                              :EE_CognitivTrainingCompleted, 
                              :EE_CognitivTrainingDataErased,
                              :EE_CognitivTrainingRejected, 
                              :EE_CognitivTrainingReset,
                              :EE_CognitivAutoSamplingNeutralCompleted, 
                              :EE_CognitivSignatureUpdated
                            ]
  enum :EE_DataChannel_t,   [ :ED_COUNTER,  0,
                              :ED_INTERPOLATED, 
                              :ED_RAW_CQ,
                              :ED_AF3, 
                              :ED_F7, 
                              :ED_F3, 
                              :ED_FC5, 
                              :ED_T7, 
                              :ED_P7, 
                              :ED_O1, 
                              :ED_O2, 
                              :ED_P8, 
                              :ED_T8, 
                              :ED_FC6, 
                              :ED_F4, 
                              :ED_F8, 
                              :ED_AF4, 
                              :ED_GYROX, 
                              :ED_GYROY, 
                              :ED_TIMESTAMP, 
                              :ED_ES_TIMESTAMP, 
                              :ED_FUNC_ID, 
                              :ED_FUNC_VALUE, 
                              :ED_MARKER, 
                              :ED_SYNC_SIGNAL ]
                             
  
  # EmoStateDLL.h enums
  
  typedef :pointer, :EmoStateHandle
  enum :EE_EmotivSuite_t, [ :EE_EXPRESSIV, 0, 
                          :EE_AFFECTIV, 
                          :EE_COGNITIV ]
  enum :EE_ExpressivAlgo_t, [
		:EXP_NEUTRAL,      0x0001,
		:EXP_BLINK,        0x0002,
		:EXP_WINK_LEFT,    0x0004,
		:EXP_WINK_RIGHT,   0x0008,
        :EXP_HORIEYE,  0x0010,
		:EXP_EYEBROW,      0x0020,
		:EXP_FURROW,       0x0040,
        :EXP_SMILE,    0x0080,
        :EXP_CLENCH,   0x0100,
		:EXP_LAUGH,        0x0200,
		:EXP_SMIRK_LEFT,   0x0400,
		:EXP_SMIRK_RIGHT,  0x0800
  ]
  
  enum :EE_AffectivAlgo_t, [
   :AFF_EXCITEMENT,   0x0001,
   :AFF_MEDITATION,   0x0002,
   :AFF_FRUSTRATION,  0x0004,
   :AFF_ENGAGEMENT_BOREDOM, 0x0008
  ]
  
  enum :EE_CognitivAction_t, [

		:COG_NEUTRAL,     0x0001,
		:COG_PUSH,        0x0002,
		:COG_PULL,        0x0004,
		:COG_LIFT,         0x0008,
		:COG_DROP	,         0x0010,
		:COG_LEFT,         0x0020,
		:COG_RIGHT,        0x0040,
		:COG_ROTATE_LEFT,  0x0080,
		:COG_ROTATE_RIGHT, 0x0100,
		:COG_ROTATE_CLOCKWISE, 0x0200,
		:COG_ROTATE_COUNTER_CLOCKWISE, 0x0400,
		:COG_ROTATE_FORWARDS,  0x0800,
		:COG_ROTATE_REVERSE,   0x1000,
		:COG_DISAPPEAR,    0x2000

	]
  
  enum :EE_SignalStrength_t, [
		:NO_SIGNAL, 0, 
    :BAD_SIGNAL, 
    :GOOD_SIGNAL
	]
  
  enum :EE_InputChannels_t, [
		:EE_CHAN_CMS, 0, 
    :EE_CHAN_DRL, 
    :EE_CHAN_FP1, 
    :EE_CHAN_AF3, 
    :EE_CHAN_F7, 
		:EE_CHAN_F3, 
    :EE_CHAN_FC5, 
    :EE_CHAN_T7, 
    :EE_CHAN_P7, 
    :EE_CHAN_O1,
		:EE_CHAN_O2, 
    :EE_CHAN_P8, 
    :EE_CHAN_T8, 
    :EE_CHAN_FC6, 
    :EE_CHAN_F4,
		:EE_CHAN_F8, 
    :EE_CHAN_AF4, 
    :EE_CHAN_FP2
	]
  
   enum :EE_EEG_ContactQuality_t, [
        :EEG_CQ_NO_SIGNAL, 
        :EEG_CQ_VERY_BAD, 
        :EEG_CQ_POOR, 
        :EEG_CQ_FAIR, 
        :EEG_CQ_GOOD]
 
  
  # Notice that EE_EngineRemoteConnect has 3 parameters while the SDK docs lists
  # two. Thats because there was a segfault when that wasn't filled in with a
  # developer id for the last parameter.
  attach_function :EE_EngineRemoteConnect,  [:string, :ushort, :string], :int
  attach_function :EE_EngineConnect,        [:string], :int
  attach_function :EE_EngineDisconnect, [], :int
  attach_function :EE_EnableDiagnostics, [:string, :int, :int], :int
  attach_function :EE_EmoEngineEventCreate, [], :EmoEngineEventHandle
  attach_function :EE_ProfileEventCreate, [], :EmoEngineEventHandle
  attach_function :EE_EmoEngineEventFree, [:EmoEngineEventHandle], :void
  attach_function :EE_EmoStateCreate, [], :EmoStateHandle
  attach_function :EE_EmoStateFree, [:EmoStateHandle], :void
  attach_function :EE_EmoEngineEventGetType, [:EmoEngineEventHandle], :EE_Event_t
  attach_function :EE_CognitivEventGetType, [:EmoEngineEventHandle], :EE_CognitivEvent_t
  attach_function :EE_ExpressivEventGetType, [:EmoEngineEventHandle], :EE_ExpressivEvent_t
  attach_function :EE_EmoEngineEventGetUserId, [:EmoEngineEventHandle, :pointer], :int
  attach_function :EE_EmoEngineEventGetEmoState, [:EmoEngineEventHandle, :EmoStateHandle],:int
  attach_function :EE_EngineGetNextEvent, [:EmoEngineEventHandle], :int
  attach_function :EE_EngineClearEventQueue, [:int], :int
 attach_function :EE_EngineGetNumUser, [:pointer], :int
attach_function :EE_SetHardwarePlayerDisplay, [:uint,:uint], :int
attach_function :EE_SetUserProfile, [:uint,:pointer,:uint], :int
attach_function :EE_GetUserProfile, [:uint,:EmoEngineEventHandle], :int
attach_function :EE_GetBaseProfile, [:EmoEngineEventHandle], :int
attach_function :EE_GetUserProfileSize, [:EmoEngineEventHandle,:pointer], :int
attach_function :EE_GetUserProfileBytes, [:EmoEngineEventHandle,:uchar,:uint], :int
attach_function :EE_LoadUserProfile, [:uint,:pointer], :int
attach_function :EE_SaveUserProfile, [:uint,:pointer], :int
attach_function :EE_ExpressivSetThreshold, [:uint,:EE_ExpressivAlgo_t,:EE_ExpressivThreshold_t,:int], :int
attach_function :EE_ExpressivGetThreshold, [:uint,:EE_ExpressivAlgo_t,:EE_ExpressivThreshold_t,:int], :int
attach_function :EE_ExpressivSetTrainingAction, [:uint,:EE_ExpressivAlgo_t], :int
attach_function :EE_ExpressivSetTrainingControl, [:uint,:EE_ExpressivTrainingControl_t], :int
attach_function :EE_ExpressivGetTrainingAction, [:uint,:pointer], :int
attach_function :EE_ExpressivGetTrainingTime, [:uint,:pointer], :int
attach_function :EE_ExpressivGetTrainedSignatureActions, [:uint,:pointer], :int
attach_function :EE_ExpressivGetTrainedSignatureAvailable, [:uint,:pointer], :int
attach_function :EE_ExpressivSetSignatureType, [:uint,:EE_ExpressivSignature_t], :int
attach_function :EE_ExpressivGetSignatureType, [:uint,:pointer], :int
attach_function :EE_CognitivSetActiveActions, [:uint,:ulong], :int
attach_function :EE_CognitivGetActiveActions, [:uint,:pointer], :int
attach_function :EE_CognitivGetTrainingTime, [:uint,:pointer], :int
attach_function :EE_CognitivSetTrainingControl, [:uint,:EE_CognitivTrainingControl_t], :int
attach_function :EE_CognitivSetTrainingAction, [:uint,:EE_CognitivAction_t], :int
attach_function :EE_CognitivGetTrainingAction, [:uint,:pointer], :int
attach_function :EE_CognitivGetTrainedSignatureActions, [:uint,:pointer], :int
attach_function :EE_CognitivGetOverallSkillRating, [:uint,:pointer], :int
attach_function :EE_CognitivGetActionSkillRating, [:uint,:EE_CognitivAction_t,:pointer], :int
attach_function :EE_CognitivSetActivationLevel, [:uint,:int], :int
attach_function :EE_CognitivSetActionSensitivity, [:uint,:int,:int,:int,:int], :int
attach_function :EE_CognitivGetActivationLevel, [:uint,:int], :int
attach_function :EE_CognitivGetActionSensitivity, [:uint,:pointer,:pointer,:pointer,:pointer], :int
attach_function :EE_CognitivStartSamplingNeutral, [:uint], :int
attach_function :EE_CognitivStopSamplingNeutral, [:uint], :int
attach_function :EE_CognitivSetSignatureCaching, [:uint,:uint], :int
attach_function :EE_CognitivGetSignatureCaching, [:uint,:pointer], :int
attach_function :EE_CognitivSetSignatureCacheSize, [:uint,:uint], :int
attach_function :EE_CognitivGetSignatureCacheSize, [:uint,:pointer], :int
attach_function :EE_HeadsetGetSensorDetails, [:EE_InputChannels_t,:pointer], :int
attach_function :EE_HardwareGetVersion, [:uint,:pointer], :int
attach_function :EE_SoftwareGetVersion, [:pointer,:uint,:pointer], :int
attach_function :EE_HeadsetGetGyroDelta, [:uint,:pointer,:pointer], :int
attach_function :EE_HeadsetGyroRezero, [:uint], :int

attach_function :EE_OptimizationParamFree, [:OptimizationParamHandle], :void
attach_function :EE_OptimizationEnable, [:OptimizationParamHandle], :int
attach_function :EE_OptimizationIsEnabled, [:pointer], :int

attach_function :EE_OptimizationGetParam, [:OptimizationParamHandle], :int
attach_function :EE_OptimizationGetVitalAlgorithm, [:OptimizationParamHandle,:EE_EmotivSuite_t,:pointer], :int
attach_function :EE_OptimizationSetVitalAlgorithm, [:OptimizationParamHandle,:EE_EmotivSuite_t,:uint], :int
attach_function :EE_ResetDetection, [:uint,:EE_EmotivSuite_t,:uint], :int
  
  
  #= ffi of EmoStateDLL.h
  
  
      
  attach_function :ES_Init, [:EmoStateHandle], :void
attach_function :ES_GetTimeFromStart, [:EmoStateHandle], :float

attach_function :ES_GetNumContactQualityChannels, [:EmoStateHandle], :int
attach_function :ES_GetContactQuality, [:EmoStateHandle,:int], :EE_EEG_ContactQuality_t
attach_function :ES_GetContactQualityFromAllChannels, [:EmoStateHandle,:pointer,:size_t], :int
attach_function :ES_ExpressivIsBlink, [:EmoStateHandle], :int
attach_function :ES_ExpressivIsLeftWink, [:EmoStateHandle], :int
attach_function :ES_ExpressivIsRightWink, [:EmoStateHandle], :int
attach_function :ES_ExpressivIsEyesOpen, [:EmoStateHandle], :int
attach_function :ES_ExpressivIsLookingUp, [:EmoStateHandle], :int
attach_function :ES_ExpressivIsLookingDown, [:EmoStateHandle], :int
attach_function :ES_ExpressivIsLookingLeft, [:EmoStateHandle], :int
attach_function :ES_ExpressivIsLookingRight, [:EmoStateHandle], :int
attach_function :ES_ExpressivGetEyelidState, [:EmoStateHandle,:pointer,:pointer], :void
attach_function :ES_ExpressivGetEyeLocation, [:EmoStateHandle,:pointer,:pointer], :void
attach_function :ES_ExpressivGetEyebrowExtent, [:EmoStateHandle], :float
attach_function :ES_ExpressivGetSmileExtent, [:EmoStateHandle], :float
attach_function :ES_ExpressivGetClenchExtent, [:EmoStateHandle], :float
attach_function :ES_ExpressivGetUpperFaceAction, [:EmoStateHandle], :EE_ExpressivAlgo_t
attach_function :ES_ExpressivGetUpperFaceActionPower, [:EmoStateHandle], :float
attach_function :ES_ExpressivGetLowerFaceAction, [:EmoStateHandle], :EE_ExpressivAlgo_t
attach_function :ES_ExpressivGetLowerFaceActionPower, [:EmoStateHandle], :float
attach_function :ES_ExpressivIsActive, [:EmoStateHandle,:EE_ExpressivAlgo_t], :int
attach_function :ES_AffectivGetExcitementLongTermScore, [:EmoStateHandle], :float
attach_function :ES_AffectivGetExcitementShortTermScore, [:EmoStateHandle], :float
attach_function :ES_AffectivIsActive, [:EmoStateHandle,:EE_AffectivAlgo_t], :int
attach_function :ES_AffectivGetMeditationScore, [:EmoStateHandle], :float
attach_function :ES_AffectivGetFrustrationScore, [:EmoStateHandle], :float
attach_function :ES_AffectivGetEngagementBoredomScore, [:EmoStateHandle], :float
attach_function :ES_CognitivGetCurrentAction, [:EmoStateHandle], :EE_CognitivAction_t
attach_function :ES_CognitivGetCurrentActionPower, [:EmoStateHandle], :float
attach_function :ES_CognitivIsActive, [:EmoStateHandle], :int
attach_function :ES_GetWirelessSignalStatus, [:EmoStateHandle], :EE_SignalStrength_t
attach_function :ES_Copy, [:EmoStateHandle,:EmoStateHandle], :void
attach_function :ES_AffectivEqual, [:EmoStateHandle,:EmoStateHandle], :int
attach_function :ES_ExpressivEqual, [:EmoStateHandle,:EmoStateHandle], :int
attach_function :ES_CognitivEqual, [:EmoStateHandle,:EmoStateHandle], :int
attach_function :ES_EmoEngineEqual, [:EmoStateHandle,:EmoStateHandle], :int
attach_function :ES_Equal, [:EmoStateHandle,:EmoStateHandle], :int
attach_function :ES_GetBatteryChargeLevel, [:EmoStateHandle,:pointer,:pointer], :void
#attach_function :ES_AffectivGetExcitementShortTermModelParams, [:EmoStateHandle,:pointer,:pointer,:pointer], :void
#attach_function :ES_AffectivGetMeditationModelParams, [:EmoStateHandle,:pointer,:pointer,:pointer], :void
#attach_function :ES_AffectivGetEngagementBoredomModelParams, [:EmoStateHandle,:pointer,:pointer,:pointer], :void
#attach_function :ES_AffectivGetFrustrationModelParams, [:EmoStateHandle,:pointer,:pointer,:pointer], :void

   class InputSensorDescriptor_t < FFI::Struct
     layout :channelId, :EE_InputChannels_t,  #// logical channel id
            :fExists,   :int,     #// does this sensor exist on this headset model
            :pszLabel,  :string,  #// text label identifying this sensor
            :xLoc, :double,       #// x coordinate from center of head towards nose
		        :yLoc, :double,       #// y coordinate from center of head towards ears
            :zLoc, :double        #// z coordinate from center of head toward top of skull 
  end 
end

module EmotivSDK
  
  class Event
    include EmotivNative
    
    def initialize(e_event, e_state)
      @e_event = e_event
      @e_state = e_state
      @event_type = self.EE_EmoEngineEventGetType(@e_event)
      @emo_state = self.EE_EmoEngineEventGetEmoState(@e_event, @e_state)
    end
    attr_reader :event_type, :emo_state
    
    def emo_time_from_start
      @emo_time_from_start ||= self.ES_GetTimeFromStart(@e_state)
    end
    
    def emo_wireless_signal_status
      @emo_wireless_signal_status ||= self.ES_GetWirelessSignalStatus(@e_state)
    end
    
    def blinked?
      @emo_blink ||= (self.ES_ExpressivIsBlink(@e_state) == 1)
    end
    
    def left_winked?
      @emo_left_wink ||= (self.ES_ExpressivIsLeftWink(@e_state) == 1)
    end
    
    def right_winked?
      @emo_right_wink ||= (self.ES_ExpressivIsRightWink(@e_state) == 1)
    end
    
    def looked_left?
      @emo_look_left ||= (self.ES_ExpressivIsLookingLeft(@e_state) == 1)
    end
    
    def looked_right?
      @emo_look_right ||= (self.ES_ExpressivIsLookingRight(@e_state) == 1)
    end
    
    
    #=upper_face_action\
    # returns either nil for no upper face action, or a symbol representing the
    # action.
    
    def upper_face_action
      @emo_upper_face_action ||= self.ES_ExpressivGetUpperFaceAction(@e_state) #EE_ExpressivAlgo_t
      if @emo_upper_face_action == 0
        nil
      else
        @emo_upper_face_action
      end
    end 
    
    def upper_face_action_power
      @emo_upper_face_action_power ||= self.ES_ExpressivGetUpperFaceActionPower(@e_state)
    end
    
    def lower_face_action
      @emo_lower_face_action ||= self.ES_ExpressivGetLowerFaceAction(@e_state) #EE_ExpressivAlgo_t
      if @emo_lower_face_action == 0
        nil
      else
        @emo_lower_face_action
      end
    end 
    
    def lower_face_action_power
      @emo_lower_face_action_power ||= self.ES_ExpressivGetLowerFaceActionPower(@e_state)
    end
    
    def excitement_short_term_score
      @emo_excitement_short_term_score ||= self.ES_AffectivGetExcitementShortTermScore(@e_state)
    end
    
    def excitement_long_term_score
      @emo_excitement_long_term_score ||= self.ES_AffectivGetExcitementLongTermScore(@e_state)
    end
    
    def engagement_boredom_score
      @emo_engagement_boredom_score ||= self.ES_AffectivGetEngagementBoredomScore(@e_state)
    end
    
    def cognitiv_action
      @emo_cognitiv_action ||= self.ES_CognitivGetCurrentAction(@e_state)
    end
    
    def cognitiv_action_power
      @emo_cognitiv_action_power ||= self.ES_CognitivGetCurrentActionPower(@e_state)
    end
    
  end
  
  class Engine   
    include EmotivNative
    # =EmotivSDK initialize
    # Takes a boolean specifying if using an emulator, and a block that
    # gets passed a class dictating the event.
    def initialize(emulator = false)
      e_event = self.EE_EmoEngineEventCreate
      e_state = self.EE_EmoStateCreate
      user_id = 0
      state = 0
      
      
      if emulator      
        if self.EE_EngineRemoteConnect("127.0.0.1", 1726, "Emotiv Systems-5") != \
            EmotivNative::EDK_OK
          raise Exception.new, "Cannot connect to remote engine." 
        end
      else
          if self.EE_EngineConnect "Emotiv Systems-5" != EmotivNative::EDK_OK
            raise Exception.new, "Cannot connect to engine."
          end
      end
      
      should_end = false
      while !should_end
        state = self.EE_EngineGetNextEvent(e_event)
        if state == EmotivNative::EDK_OK
          should_end = yield(Event.new(e_event, e_state))
        elsif state == EmotivNative::EDK_NO_EVENT
        else
          raise Exception.new, "There was an error with getting the state. (#{state})"
        end
      end
      self.EE_EngineDisconnect
      self.EE_EmoStateFree(e_state)
      self.EE_EmoEngineEventFree(e_event)
    end 
  end
end

EmotivSDK::Engine.new(true) do |event|
  puts event.event_type
  puts event.emo_state
  puts event.emo_time_from_start
  
  puts "You have #{event.blinked? ? '' : 'not '}blinked."
  puts "You have #{event.left_winked? ? '' : 'not '}left winked."
  puts "You have #{event.right_winked? ? '' : 'not '}right winked."
  puts "You have #{event.looked_left? ? '' : 'not '}looked_left."
  puts "You have #{event.looked_right? ? '' : 'not '}looked_right."
  puts "Your upperface action is: #{event.upper_face_action}."
  puts "Your upperface power level: #{event.upper_face_action_power}"
end