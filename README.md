# shopping
쇼핑몰 서비스를 제공하는 앱

## Getting Started

어플을 설치하세요 

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)

프로바이더 쓰는 방법
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 프로바이더 쓰는 1 방법
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       TextButton(
      //         onPressed: () {
      //           context.read<OnboardingNotifier>().setSelectedPage = 4;
      //         },
      //         child: Text('Increement'),
      //       ),
      //       Text(context.watch<OnboardingNotifier>().selectedPage.toString()),
      //     ],
      //   ),
      // ), 아래와 같이 Consumer를 쓰는 방식으로 변경

      // 프로바이더 쓰는 2 방법
      // body: Consumer<OnboardingNotifier>(
      //   builder: (context, onboardingNotifier, child) {
      //     return Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         TextButton(
      //           onPressed: () {
      //             onboardingNotifier.setSelectedPage = 9;
      //           },
      //           child: Text('increment'),
      //         ),
      //         Text(onboardingNotifier.selectedPage.toString()),
      //       ],
      //     );
      //   },
      // ),

      // 프로바이더 쓰는 3 방법
      // final pro = Provider.of<OnboardingNotifier>(context);
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     TextButton(
      //       onPressed: () {
      //         pro.setSelectedPage = 111;
      //       },
      //       child: Text('Increment'),
      //     ),
      //     Text(pro.selectedPage.toString()),
      //   ],
      // ),

훗위젯을 쓰는 이유: useEffect를 쓰기 위해서. 