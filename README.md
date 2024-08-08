# Namer App

> Namer App은 Provider 패키지를 사용한 간단한 상태 관리 솔루션을 보여주는 Flutter 프로젝트입니다. 이 앱은 카운터를 증가시키고 하트 아이콘을 애니메이션으로 토글하는 기본 기능을 포함하고 있습니다.

## 목차
- [소개](#소개)
- [프로젝트 구조](#프로젝트-구조)
- [시작하기](#시작하기)
  - [필수 조건](#필수-조건)
  - [설정](#설정)
  - [앱 실행하기](#앱-실행하기)
- [Flutter 아키텍처](#flutter-아키텍처)
  - [GetX](#getx)
  - [BLoC](#bloc)
  - [Provider](#provider)


## 소개

> Namer App은 Flutter와 Provider 패키지를 사용하여 상태 관리를 쉽게 구현하는 방법을 보여줍니다. 이 앱은 간단한 카운터 증가 기능과 하트 아이콘 애니메이션 토글 기능을 포함하고 있습니다.


## 프로젝트 구조

lib/  
├── main.dart  
├── models/  
│ └── counter.dart  
│ └── food_provider.dart  
│ └── food.dart  
│ └── item.dart  
├── ui/  
│ ├── my_home_page.dart  
│ ├── person_page.dart  
│ ├── food_detail_page.dart  
│ ├── food_list_page.dart  
│ ├── item_detail_page.dart  
│ ├── recipe_page.dart  
│ ├── search_page.dart    
├── widgets/  
│ ├── custom_app_bar.dart  
│ ├── custom_bottom_app_bar.dart  
│ ├── custom_drawer.dart  
└──--------------------


## 시작하기

### 필수 조건

- macOS
- Flutter SDK
- Xcode (iOS 개발을 위해 필요)
- Android Studio (선택 사항)

### 설정

1. Flutter SDK 설치: [Flutter 공식 사이트](https://flutter.dev/docs/get-started/install)에서 Flutter SDK를 설치합니다.
2. Xcode 설치: [Mac App Store](https://apps.apple.com/us/app/xcode/id497799835?mt=12)에서 Xcode를 설치합니다.
3. Android Studio 설치 (선택 사항): [Android Studio 공식 사이트](https://developer.android.com/studio)에서 설치합니다.
4. 프로젝트 클론:

   ```sh
   git clone https://github.com/yourusername/namer_app.git
   cd namer_app
   ```
### 앱 실행하기
- iOS 시뮬레이터 실행 : 
```sh
open -a Simulator
```   
- App 실행
```sh
flutter run
```

## Flutter 아키텍처

### 아키텍처 라이브러리를 사용하는 목적?  
> Flutter 을 처음 시작하지만 아키텍처 구조를 선택해서 사용하는것이 유지보수나 개발할때 편하고 코드를 읽기 쉽게 하기위한 용도이기때문에 어떤 오픈소스 라이브러리가 있는지 검색하였고 아래 3개 아직 제대로 사용도 해본적 없으나 목적에 맞게 선택해서 사용을 해보려고 한다.

### 혼자 개발 할때 좋은 구조는?  
> 다행스럽게도 라인 개발 블로그에서 정리해둔 내용이 있어서 결론부터 예기하면 "Provider" 사용하려고한다.  
자세한 내용은 아래 링크 참조 굳이 다른것들을 더살펴보고 공부하면서 따라해보진 않을것이다.  
서비스 목적이고 코드를 이쁘게 리뷰 하며 다른사람들과 공유하며 할내용이 아니기 때문이다.   
나중에 한번 고려만 해보려고한다.

참고링크 : https://engineering.linecorp.com/ko/blog/flutter-architecture-getx-bloc-provider


### Provider 아키텍처 라이브러리

#### Provider 패키지 구조 
lib/  
├── main.dart  
├── models/  
│ └── counter.dart  
├── ui/  
│ ├── my_home_page.dart  
│ ├── person_page.dart  
└── widgets/  
└── custom_drawer.dart  

#### pubspec.yaml
> 아래 yaml 에 사용하려고하는 아키텍처 라이브러리를 선언하면된다. 이부분은 Java gradle 설정과 흡사하지만 간단하다.!!
```yaml
생략 ...

dependencies:
  flutter:
    sdk: flutter

  english_words: ^4.0.0
  provider: ^6.0.0
  cupertino_icons: ^1.0.6
  http: ^1.2.2

생략 ...  
```

### 좀더 구조직인 부분은 찾아보고 다듬어야한다.
> 기술블로그 : https://velog.io/@lswteen/Flutter-App-%EB%A7%8C%EB%93%A4%EA%B8%B0
