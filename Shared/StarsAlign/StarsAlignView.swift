
import SwiftUI

struct StarsAlignView: View {
    var title: String
    @State private var tick = 0
    @State private var tickText = "Tick: 0"
    @State private var iterate = "1"
    @State var align: StarsAlign
    @State var text: String
    @FocusState private var focused: Bool
    
    var body: some View {
        VStack {
            VStack {
                TextEditor(text: $text)
                    .cornerRadius(5.0)
                    .padding(15)
                    .shadow(radius: 5)
                    .lineSpacing(-22.0)
                    .font(.caption2)
                    .disabled(true)
            }

            HStack {
                Button {
                    if focused { return }
                    guard let t = Int(iterate) else { return }
                    tick -= t
                    tickText = "Tick: \(tick)"
                    align.fastForward(-1*t)
                    text = align.printt()
                } label: {
                    Image(systemName: "arrow.left.circle.fill").font(.system(size: 40))
                }
                .padding()

                Spacer()

                TextField("Iterate", text: $iterate)
                    .cornerRadius(5)
                    .padding()
                    .background(.background)
                    .frame(maxWidth: 100)
                    .multilineTextAlignment(.center)
                    .focused($focused)
                    .keyboardType(.numberPad)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("OK") {
                                focused = false
                            }
                        }
                    }
                    .textFieldStyle(.roundedBorder)

                Spacer()

                Button {
                    if focused { return }
                    guard let t = Int(iterate) else { return }
                    tick += t
                    tickText = "Tick: \(tick)"
                    align.fastForward(t)
                    text = align.printt()
                } label: {
                    Image(systemName: "arrow.right.circle.fill").font(.system(size: 40))
                        
                }.padding()
                
            }
            
            HStack {
                Text(tickText)
            }.background()
            
        }.navigationTitle(title)
    }
}

struct StarsAlignView2_Previews: PreviewProvider {
    static let align = StarsAlign(with: StarsAlign.input)
    static var previews: some View {
        StarsAlignView(title: "Stars Align", align: align, text: align.printt())
    }
}
