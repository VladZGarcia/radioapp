//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import audio_session
import bottom_navbar_player
import just_audio
import path_provider_foundation
import video_player_avfoundation

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  AudioSessionPlugin.register(with: registry.registrar(forPlugin: "AudioSessionPlugin"))
  BottomNavbarPlayerPlugin.register(with: registry.registrar(forPlugin: "BottomNavbarPlayerPlugin"))
  JustAudioPlugin.register(with: registry.registrar(forPlugin: "JustAudioPlugin"))
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
  FVPVideoPlayerPlugin.register(with: registry.registrar(forPlugin: "FVPVideoPlayerPlugin"))
}
