part of 'package:recipe_service/presentation/sign_in/sign_in_page.dart';

class _LoadingState extends StatelessWidget {
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 1.0,
      ),
    );
  }
}
