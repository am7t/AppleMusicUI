import SwiftUI

struct ContentView: View {
    // Basic Interactivity
    @State private var isPlaying: Bool = true
    @State private var isFavorite: Bool = false
    @State private var progress: Double = 0.4
    @State private var volume: Double = 0.7
    
    var body: some View {
        ZStack {
            // LinearGradient Background
            LinearGradient(
                colors: [Color(white: 0.15), Color.black],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Top Screen Capsule
                Capsule()
                    .fill(Color.gray)
                    .frame(width: 40, height: 5)
                    .padding(.top, 10)
                
                Spacer()
                
                // Album Art
                Image("forallthedogs")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .padding(.horizontal, 30)
                
                Spacer()
                
                // Song Title & Favorite Button
                HStack {
                    VStack(alignment: .leading) {
                        Text("Virginia Beach")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.white)
                        
                        Text("Drake")
                            .font(.headline)
                            .foregroundStyle(.gray)
                    }
                    
                    Spacer()
                    
                    Button {
                        isFavorite.toggle()
                    } label: {
                        Image(systemName: isFavorite ? "star.fill" : "star")
                            .font(.title2)
                            .foregroundStyle(isFavorite ? .pink : .gray)
                    }
                }
                .padding(.horizontal, 30)
                
                // Slider & Timers
                VStack {
                    Slider(value: $progress)
                        .tint(.white)
                    
                    HStack {
                        Text("1:40")
                        Spacer()
                        Text("-2:31")
                    }
                    .font(.caption)
                    .foregroundStyle(.gray)
                }
                .padding(.horizontal, 30)
                
                // Media Controls
                HStack(spacing: 50) {
                    Image(systemName: "backward.fill")
                        .font(.title)
                    
                    Button {
                        isPlaying.toggle()
                    } label: {
                        Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                            .font(.largeTitle)
                    }
                    
                    Image(systemName: "forward.fill")
                        .font(.title)
                }
                .foregroundStyle(.white)
                .padding(.vertical, 10)
                
                // Volume Slider
                HStack(spacing: 15) {
                    Image(systemName: "speaker.fill")
                        .foregroundStyle(.gray)
                    
                    Slider(value: $volume)
                        .tint(.white)
                    
                    Image(systemName: "speaker.wave.3.fill")
                        .foregroundStyle(.gray)
                }
                .padding(.horizontal, 30)
                
                Spacer()
                
                // Dynamic Island Dock
                HStack(spacing: 40) {
                    Image(systemName: "quote.bubble")
                    Image(systemName: "airplayaudio")
                    Image(systemName: "list.bullet")
                }
                .font(.title3)
                .foregroundStyle(.white)
                .padding(.vertical, 12)
                .padding(.horizontal, 35)
                .background(.ultraThinMaterial)
                .clipShape(Capsule())
                .padding(.bottom, 20)
            }
        }
    }
}

#Preview {
    ContentView()
}
