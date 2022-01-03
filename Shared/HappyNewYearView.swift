
import SwiftUI

struct HappyNewYearView: View {
    var body: some View {
        NavigationView {
            VStack() {
                VStack() {
                    HStack {
                        Spacer()
                        Image("me")
                            .resizable()
                            .frame(
                                maxWidth: 80,
                                maxHeight: 80
                            )
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(40)
                    }.padding(.bottom, 50.0)
                    
                    Image("happy")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(6.0)
                        .frame(width: UIScreen.main.bounds.width)
                    Image("logo")
                        .padding(.top, -40.0)
                    
                }.padding()
                
                List {
                    let align = StarsAlign(with: StarsAlign.input)
                    NavigationLink(
                        "2018 Day 10 - The Stars Align",
                        destination: StarsAlignView(title: "The Stars Align", align: align, text: align.printt())
                    )
                    NavigationLink(
                        "2021 Day 6 - Lanternfish",
                        destination: ProblemView()
                    )
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct HappyNewYearView_Previews: PreviewProvider {
    static var previews: some View {
        HappyNewYearView()
    }
}
