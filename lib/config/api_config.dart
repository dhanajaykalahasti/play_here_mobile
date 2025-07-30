class ApiConfig {
  // 🌐 Base URL of your backend
  static const String baseUrl = "http://localhost:8085"; // Change to your server IP or domain

  // 🔐 Auth Endpoints
  static const String register = "$baseUrl/api/user/signup";
  static const String verifyCode = "$baseUrl/api/user/verify";
  static const String login = "$baseUrl/api/user/login";
  static const String resendCode = "$baseUrl/api/user/resend-verification";


  // 👤 User Endpoints
  static const String userProfile = "$baseUrl/api/user/profile";

  // 📅 Booking Endpoints
  static const String myBookings = "$baseUrl/api/bookings/my";
  static const String allBookings = "$baseUrl/api/bookings";
  static const String cancelBooking = "$baseUrl/api/bookings/cancel";

  // 🏟️ Venue Endpoints
  static const String venues = "$baseUrl/api/venues";
  static const String venueById = "$baseUrl/api/venues"; // + /:id when used

  // ⭐ Review Endpoints
  static const String reviews = "$baseUrl/api/reviews";
  static const String myReviews = "$baseUrl/api/reviews/my";

  // 💳 Payment
  static const String createPayment = "$baseUrl/api/payment/create";
  static const String verifyPayment = "$baseUrl/api/payment/verify";

  // 📊 Admin Endpoints
  static const String adminStats = "$baseUrl/api/admin/stats";
  static const String allUsers = "$baseUrl/api/admin/users";
}