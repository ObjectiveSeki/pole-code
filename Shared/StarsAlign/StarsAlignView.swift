
import SwiftUI


struct StarsAlignView2_Previews: PreviewProvider {
    static let align = StarsAlign(with: StarsAlign.input)
    static var previews: some View {
        StarsAlignView(title: "Stars Align")//, align: align, text: align.printt())
    }
}

struct StarsAlignView: View {
    var title: String
    @State private var iterate = "1"
    @StateObject var alignVM = StarsAlignVM()
    @FocusState private var focused: Bool
    
    var body: some View {
        VStack {
            VStack {
                TextEditor(text: $alignVM.text)
                    .cornerRadius(10)
                    .padding(15)
                    .shadow(radius: 5)
                    .lineSpacing(-22)
                    .font(.caption2)
                    .disabled(true)
            }.onAppear {
                alignVM.load()
            }

            HStack {
                Button {
                    if focused { return }
                    alignVM.backwards(iterate)
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
                    alignVM.forward(iterate)
                } label: {
                    Image(systemName: "arrow.right.circle.fill").font(.system(size: 40))
                        
                }.padding()
                
            }
            
            HStack {
                Text(alignVM.tickText)
            }.background()
            
        }.navigationTitle(title)
    }
}

