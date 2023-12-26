#if canImport(SwiftUI)
import SwiftUI
#endif

public struct SDSNavigationView: View {
    let style: SDSNavigationStyle
    public init(style: SDSNavigationStyle) {
        self.style = style
    }
    public var body: some View {
        switch style {
        case .leftTitleRightDismissButton(title: let title, dismissImage: let dismissImage, action: let action):
            HStack(alignment: .center) {
                Text(title)
                    .foregroundColor(Color(uiColor: .gray600))
                    .font(Font(SDSFont.title1.font))
                    .padding(.leading, 20)
                Spacer()
                Button {
                    action()
                } label: {
                    Image(uiImage: dismissImage)
                        .resizable()
                        .frame(width: 36, height: 36)
                }
                .padding(.trailing, 10)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 52)
        case .leftPopButtonMiddleTitle(title: let title, action: let action):
            HStack(alignment: .center) {
                Button {
                    action()
                } label: {
                    Image(uiImage: SDSIcon.icNavigationBarLeft)
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .padding(.leading, 10)
                Spacer()
                Text(title)
                    .font(Font(SDSFont.subTitle.font))
                    .foregroundColor(Color(uiColor: .gray600))
                Spacer()
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 24, height: 24)
                    .padding(.trailing, 10)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 52)
        case .titleRightDismissButton(title: let title, dismissImage: let dismissImage, action: let action):
            HStack(alignment: .center) {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 36, height: 36)
                .padding(.leading, 10)
                Spacer()
                Text(title)
                    .font(Font(SDSFont.subTitle.font))
                    .foregroundColor(Color(uiColor: .gray600))
                Spacer()
                Button {
                    action()
                } label: {
                    Image(uiImage: dismissImage)
                        .resizable()
                        .frame(width: 36, height: 36)
                }
                .padding(.trailing, 10)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 52)
        case .leftPopButtonMiddleTitleRightDismissButton(title: let title, dismissImage: let dismissImage, popAction: let popAction, dismissAction: let dismissAction):
            HStack(alignment: .center) {
                Button {
                    popAction()
                } label: {
                    Image(uiImage: SDSIcon.icNavigationBarLeft)
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .padding(.trailing, 12)
                .padding(.leading, 10)
                Spacer()
                Text(title)
                    .font(Font(SDSFont.subTitle.font))
                    .foregroundColor(Color(uiColor: .gray600))
                Spacer()
                Button {
                    dismissAction()
                } label: {
                    Image(uiImage: dismissImage)
                        .resizable()
                        .frame(width: 36, height: 36)
                }
                .padding(.trailing, 10)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 52)
        case .leftPopButtonMiddleTitleRightCustomButton(title: let title, customButtonTitle: let customButtonTitle, popAction: let popAction, dismissAction: let dismissAction):
            HStack(alignment: .center) {
                Button {
                    popAction()
                } label: {
                    Image(uiImage: SDSIcon.icNavigationBarLeft)
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .padding(.trailing, 20)
                .padding(.leading, 10)
                Spacer()
                Text(title)
                    .font(Font(SDSFont.subTitle.font))
                    .foregroundColor(Color(uiColor: .gray600))
                Spacer()
                Button {
                    dismissAction()
                } label: {
                    Text(customButtonTitle)
                        .foregroundColor(Color(uiColor: .lightBlue600))
                        .font(Font(SDSFont.btn2.font))
                        .padding(.horizontal, 10)
                }
                .padding(.trailing, 10)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 52)
        }
    }
}
