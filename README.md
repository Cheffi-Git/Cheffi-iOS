# Cheffi

> 맛집 리뷰 공유 플랫폼 - 8인 팀 프로젝트

[![Swift](https://img.shields.io/badge/Swift-5.9+-orange.svg)](https://swift.org)
[![iOS](https://img.shields.io/badge/iOS-15.0+-lightgrey.svg)](https://www.apple.com/ios/)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-3.0-blue.svg)](https://developer.apple.com/xcode/swiftui/)

## 스크린샷

> TODO: 스크린샷 추가 예정
> - 맛집 검색 화면 (근처 맛집 리스트)
> - 맛집 검색 화면 (검색 결과)
> - 신규 맛집 등록 화면
> - 리뷰 작성 화면
> - 마이페이지

---

## 프로젝트 소개

사용자가 맛집을 등록하고 리뷰를 공유할 수 있는 소셜 플랫폼입니다.

- **제작 기간**: 2024년 1월 ~ 2024년 4월 (약 4개월)
- **참여 인원**: 총 8인 (기획 1, 디자이너 1, 백엔드 2, AOS 2, iOS 2)
- **본인 역할**: iOS 개발자 (2인 중 1인)
- **프로젝트 상태**: 미완성 (팀 사정으로 중단)

### 참여 배경

맛집 정보를 공유하고 추천할 수 있는 커뮤니티 기반 플랫폼을 목표로 시작한 사이드 프로젝트입니다. SwiftUI와 The Composable Architecture(TCA)를 실무 수준으로 학습하고, Clean Architecture를 실제 프로젝트에 적용해보고자 참여한 사이드 프로젝트입니다. 또한 팀 협업 환경에서 Git Flow를 활용한 브랜치 전략과 코드 리뷰 프로세스를 경험하며, 회사 업무가 아닌 사이드 프로젝트에서 백엔드 API 연동부터 배포까지 전체 개발 사이클을 직접 경험하고 싶었습니다.

### 주요 기능

**구현 완료된 기능:**
- OAuth 소셜 로그인 (Kakao)
- 프로필 등록 및 음식 취향 설정
- 맛집 검색 (위치 기반 근처 맛집, 키워드 검색)
- 신규 맛집 등록
- 리뷰 작성 (사진, 텍스트, 해시태그)
- 전국 트렌드 화면
- 마이페이지 (프로필 정보, 나의 취향, 리뷰 목록)

**미완성 기능:**
- 홈 탭 일부 기능 (알림, 검색 자동완성)
- 마이페이지 일부 기능 (팔로우/팔로잉, 계정 관리)
- 리뷰 상세 및 신고 기능

전체 진행률: UI 약 89%, API 연동 약 48%

---

## 본인의 역할

### 담당 역할
- iOS 앱 개발 (2인 중 1인, 전체 iOS 커밋의 약 47% 기여)
- 전체 336 커밋 중 159 커밋 작성

### 구현한 주요 기능

**1. 맛집 등록 기능 (Restaurant Registration)**
- 맛집 검색 화면 (RestaurantRegistSearch)
  - 위치 기반 근처 맛집 리스트 조회
  - 키워드 검색 및 하이라이팅 처리
  - 빈 화면 상태 처리
- 신규 맛집 등록 화면 (RestaurantRegistCompose)
  - 지역 선택 기능
  - 맛집 정보 입력
- 리뷰 작성 화면 (ReviewCompose)
  - 사진 업로드
  - 텍스트 입력
  - 메뉴 정보 입력 팝업
- 해시태그 선택 화면 (ReviewHashtags)
- 관련 API 연동 (5/5 완료)

**2. 마이페이지 (My Page)**
- 프로필 정보 영역 UI
- 나의 취향 영역 UI
- 리뷰 메뉴 탭 UI
- 리뷰 목록 및 빈 화면 UI
- 타인의 마이페이지 분기 처리
- API 연동 (`/api/v1/profile`)

**3. 전국 트렌드 (National Trend)**
- 전체 화면 UI 구현
- Reducer 및 라우팅 구현

**4. 공통 컴포넌트 (Common Components)**
- NavigationBarView (leftButtonKind nil 타입 추가)
- 공통 팝업 (ConfirmPopup)
- 에러 핸들링 (에러 팝업)

**5. 개발 환경 세팅**
- 최소 배포 타겟 iOS 15.0 → iOS 17.0 변경
- Kakao SDK 버전 관리 (2.21.1 고정, Xcode 15.3 빌드 에러 해결)
- 자동 배포 환경 구축
- TCA 메인 쓰레드 워닝 해소
- 런치 스크린 설정

### 맡은 화면의 사용자 플로우

**플로우 1: 기존 맛집에 리뷰 등록**
```
맛집 등록 탭 클릭
→ 검색 화면 (근처 맛집 or 검색)
→ 맛집 선택
→ 리뷰 작성 화면
→ 해시태그 선택
→ 완료
```

**플로우 2: 신규 맛집 등록 및 리뷰 작성**
```
맛집 등록 탭 클릭
→ 검색 화면 (검색)
→ "찾고 있는 맛집이 없나요? 등록하기" 클릭
→ 신규 맛집 등록 화면
→ 리뷰 작성 화면
→ 해시태그 선택
→ 완료
```

---

## 기술 스택

### 언어 & 프레임워크
- **Swift 5.9+**
- **SwiftUI 3.0** - 선언형 UI 구현
- **Combine** - 반응형 프로그래밍
- **The Composable Architecture (TCA)** - 상태 관리 및 비즈니스 로직 분리

### 라이브러리
- **SnapKit 5.0** - AutoLayout DSL
- **Kingfisher 6.3** - 비동기 이미지 다운로드 및 캐싱
- **Kakao SDK** - 소셜 로그인

### 아키텍처 & 패턴
- **Clean Architecture** - 계층 분리 (Presentation / Domain / Data / Infrastructure)
- **MVVM 패턴** - View와 비즈니스 로직 분리
- **Coordinator 패턴** - 화면 전환 로직 분리
- **TCA (The Composable Architecture)** - 단방향 데이터 플로우 및 상태 관리

### 프로젝트 구조
```
Cheffi/
├── Application/          # 앱 진입점 및 DI Container
├── Presentation/         # UI Layer (SwiftUI Views, Reducers)
│   ├── RestaurantRegistScene/   # 맛집 등록 관련 화면
│   ├── MyPageScene/              # 마이페이지
│   ├── NationalTrendScene/       # 전국 트렌드
│   ├── HomeScene/                # 홈 화면
│   └── LoginScene/               # 로그인 및 프로필 등록
├── Domain/               # Business Logic Layer (Use Cases, Entities)
├── Data/                 # Data Layer (Repositories, DTOs)
├── Infrastructure/       # 네트워크, 데이터베이스 등
├── Common/               # 공통 컴포넌트 및 유틸리티
└── Resources/            # Assets, Fonts, Info.plist
```

---

## 기술적 챌린지

### 1. TCA를 활용한 복잡한 화면 상태 관리

**문제**: 맛집 검색 화면에서 여러 상태(근처 맛집 / 검색 결과 / 빈 화면)를 관리해야 했고, 각 상태에 따라 다른 UI를 보여줘야 했습니다.

**해결**:
- TCA의 Reducer를 활용하여 상태를 명확하게 정의
- 각 하위 화면(NearRestaurantList, RestaurantList)을 독립적인 Reducer로 분리
- Scope를 이용한 상태 구독으로 UI 자동 업데이트 구현

```swift
@ViewStore(RestaurantRegistSearchReducer.self)
struct RestaurantRegistSearchView: View {
    var body: some View {
        if viewStore.searchBarState.searchQuery.isEmpty {
            if viewStore.isEmptyNearRestaurant {
                EmptyDescriptionView(...)
            } else {
                NearRestaurantListView(...)
            }
        } else {
            if viewStore.isEmptyRestaurant {
                EmptyDescriptionView(...)
            } else {
                RestaurantListView(...)
            }
        }
    }
}
```

**배운 점**: TCA의 단방향 데이터 플로우 덕분에 복잡한 상태 관리가 예측 가능하고 테스트 가능한 코드로 작성되었습니다.

### 2. Kakao SDK 버전 호환성 문제

**문제**: Xcode 15.3 업데이트 후 Kakao SDK 2.22.0에서 빌드 에러가 발생했습니다.

**해결**:
- 커뮤니티 및 이슈 트래커 조사를 통해 버그 해결된 2.21.1 버전 확인
- Podfile에서 버전 고정하여 팀 전체 빌드 환경 안정화

```ruby
# Podfile
pod 'KakaoSDK', '2.21.1'  # Xcode 15.3 호환 버전
```

**배운 점**: 외부 라이브러리 의존성 관리의 중요성과 버전 고정의 필요성을 경험했습니다.

### 3. 검색 결과 키워드 하이라이팅

**문제**: 사용자가 입력한 검색어를 검색 결과에서 시각적으로 강조해야 했습니다.

**해결**:
- AttributedString을 활용하여 검색어 부분의 폰트 색상 변경
- 대소문자 구분 없이 하이라이팅 처리

**배운 점**: SwiftUI에서 텍스트 스타일링을 위한 AttributedString 활용법을 익혔습니다.

### 4. TCA 메인 쓰레드 워닝 해소

**문제**: 비동기 작업 후 상태 업데이트 시 메인 쓰레드 관련 워닝이 발생했습니다.

**해결**:
- Effect에서 `.receive(on: DispatchQueue.main)` 사용
- TCA의 스케줄러를 명시적으로 메인 쓰레드로 지정

**배운 점**: TCA에서 비동기 작업과 UI 업데이트의 올바른 처리 방법을 학습했습니다.

---

## 팀 협업

### Git 브랜치 전략
- **develop 브랜치 기반 작업**
- Feature 브랜치 생성 후 Pull Request
- 이슈 번호 기반 커밋 메시지 작성 (예: `#61 맛집등록 검색결과 리스트 조회 API 연동`)

### 코드 리뷰
- Pull Request를 통한 코드 리뷰 진행
- 다른 iOS 개발자와 상호 리뷰

### 커뮤니케이션
- GitHub Issues를 통한 작업 관리
- 주 1회 주기적인 팀 미팅

### 협업 경험
- 백엔드 API 명세에 따른 네트워킹 코드 작성
- AOS 개발자와 UI/UX 일관성 논의
- 디자이너와 피그마 기반 UI 구현

---

## 프로젝트 회고

### 중단 이유

팀 리더는 프로젝트 사업화를 목표로 했지만, 개발자들은 커리어 관리를 위한 사이드 프로젝트로 참여하고 있었습니다. 본업과 병행하며 주말과 여가 시간에 진행하는 개발자들과 전업으로 사활을 거는 팀 리더 사이의 개발 일정 관련 이견이 좁혀지지 않았습니다. 팀 리더가 프로젝트 중단을 선언하며 종료되었습니다.

### 완성했다면?

앱 출시 후 다음과 같은 기능을 추가할 계획이었습니다:
- 팔로우 기반 피드 시스템
- 맛집 북마크 및 방문 체크리스트
- 지역별 맛집 랭킹
- 알림 기능 (좋아요, 댓글, 팔로우)

### 배운 점

**기술적 성장:**
- SwiftUI와 TCA를 활용한 앱 개발 경험
- Clean Architecture 적용을 통한 계층 분리 학습
- 사이드 프로젝트에서 백엔드 API 연동 및 Git을 활용한 협업 경험

**협업 능력:**
- 팀 프로젝트에서의 커뮤니케이션 중요성
- 이슈 기반 작업 관리 방식
- 코드 리뷰를 통한 코드 품질 향상

**아쉬운 점:**
- 프로젝트 목표에 대한 팀원 간 명확한 합의 부족
- 일정 관리 및 현실적인 목표 설정의 중요성

---

## 실행 방법

### 요구 사항
- Xcode 15.0+
- iOS 15.0+
- Swift 5.9+
- CocoaPods

### 설치 및 실행
```bash
# 1. 저장소 클론
git clone https://github.com/Cheffi-Git/Cheffi-iOS.git

# 2. 프로젝트 디렉토리 이동
cd Cheffi-iOS

# 3. CocoaPods 의존성 설치
pod install

# 4. Workspace 열기
open Cheffi.xcworkspace

# 5. Xcode에서 실행 (⌘ + R)
```

**주의**: Kakao 로그인 기능 사용을 위해 Kakao Developers에서 앱 키 발급 및 설정이 필요합니다.

---

## 기여자

- **iOS**: Eli (본인), [Ronick](https://github.com/ronick-grammer)
- **Android**: [Juyeon Lim](https://github.com/dollyishere), [이제일](https://github.com/WorldOneTop)
- **Backend**: [Lee Seunghyeon](https://github.com/seulee0862), [Lee Junpyo](https://github.com/wnsvy607)
- **Design**: 1인 (이름을 알수없음)
- **PM**: [Jay](https://github.com/stablewoo)
