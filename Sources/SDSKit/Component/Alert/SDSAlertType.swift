#if canImport(UIKit)
import UIKit
#endif

public enum SDSAlertType {
    /**ok, cancel 두개다 있는 경우**/
    case alert //버튼 두 개
    case noti //버튼 한 개
}

public enum SDSAlertNumberOfLines {
    /**message 내용이 한 줄, 두 줄인 경우**/
    case singleLineTitled //한 줄, 제목이 있는 경우
    case singleLineUnTitled //한 줄, 제목이 없는 경우
    case multiLineTitled //두 줄, 제목이 있는 경우
    case multiLineUnTitled //두 줄, 제목이 없는 경우
}
