
import SwiftUI
import WebKit


struct WebView: UIViewRepresentable {
    var url: URL
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

struct RepoWebView: View {
    var title: String
    var body: some View {
        WebView(url: URL(string: "https://github.com/ObjectiveSeki/polecode")!)
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
    }
}
