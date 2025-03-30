abstract class CodeVerificationRepository {
  Future<void> emailVerification(String code); // ممكن اضافة شيء غير الكود مثل الايميل
  Future<void> passwordVerification(String code);
}
