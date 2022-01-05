
import SwiftUI


struct LanternfishView_Previews: PreviewProvider {
    static var previews: some View {
        LanternfishView(title: "Lanternfish")
    }
}

struct LanternfishView: View {
    @StateObject var viewModel = LanternfishViewModel(
        lanternfish: Lanternfish(input: LanternfishInput.input)
    )
    public var title: String
    public var backgroundColor = Color.lanternBackground
    public var innerRadiusFraction = 0.5
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                VStack {
                    ZStack {
                        Rectangle()
                            .fill(backgroundColor)
                            .cornerRadius(10)
                            .padding(15)
                            .shadow(radius: 5)
                        ForEach(viewModel.slices) { slice in
                            PieSliceView(pieSliceData: slice)
                        }
                        .frame(
                            width: geometry.size.width-60,
                            height: geometry.size.width-60
                        )
                        Circle()
                            .fill(backgroundColor)
                            .frame(
                                width: geometry.size.width * innerRadiusFraction,
                                height: geometry.size.width * innerRadiusFraction
                            )
                        VStack {
                            Text("Total lanterns:")
                                .font(.title3)
                                .foregroundColor(Color.gray)
                            Text(String(viewModel.total.formatted))
                                .font(.title3)
                                .foregroundColor(.white)
                        }
                    }
                    PieChartRows(
                        colors: viewModel.colors,
                        names: viewModel.names,
                        values: viewModel.values.map { Int($0).formatted }
                    )
                    Spacer()
                }
            }
            
        }
        .navigationTitle(title)
        .onAppear { viewModel.load() }
    }
}


struct PieChartRows: View {
    var colors: [Color]
    var names: [String]
    var values: [String]
    
    var body: some View {
        VStack{
            ForEach(0..<self.values.count) { i in
                HStack {
                    RoundedRectangle(cornerRadius: 5.0)
                        .fill(self.colors[i])
                        .frame(width: 14, height: 14)
                    Text(self.names[i])
                        .font(.caption)
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(self.values[i])
                            .font(.caption)
                            .foregroundColor(Color.primary)
                    }
                }
            }
        }
        .padding()
    }
}

