# 📢 PhraseBot - AI Chat App

PhraseBot is a **Flutter-based AI chatbot** that provides real-time conversations using **Google gemini API**. It also features **user authentication with Supabase** for a secure and personalized experience.

---

## 🚀 Features

- **AI-Powered Chat** - Uses Google Gemini API for intelligent conversations.  
- **Supabase Authentication** - Secure login & signup with email/password.  
-  **Real-time Messaging** - Smooth conversation flow with a chatbot.  
-  **User Profile Management** - Store user data like names in Supabase.  
-  **Flutter-based UI** - Cross-platform support for Android & iOS.  
-  **Error Handling** - Manages API failures with retry mechanisms.  
-  **Stores Chat History** - Stores the chat history in Supabase.  

---

## 🛠️ Tech Stack
- **Flutter** (Frontend Framework)
- **Gemini API** (AI Chatbot Backend - Google Gemini)
- **Supabase** (Authentication & User Management)
- **Dio** (HTTP requests for API integration)
- **Provider** (State Management)

---

## 📌 Installation & Setup
### **1️⃣ Clone the Repository**
```bash
git clone https://github.com/SubramanyaKS/phrasebot.git
cd phrasebot
```

### **2️⃣ Install Dependencies**
```bash
flutter pub get
```

### **3️⃣ Set Up Supabase**
1. **Create a free Supabase account** at [supabase.com](https://supabase.com/).
2. **Create a new project** and copy the **Anon Key** & **Project URL**.
3. **Enable Authentication** in Supabase (Email/Password).
4. **Update `.env` file** with your Supabase credentials:
   ```env
   SUPABASE_URL=https://your-project.supabase.co
   SUPABASE_ANON_KEY=your-anon-key
   GOOGLE_GEMINI_API=your-gemini-api-uri
   GEMINI_API_KEY=your-google-gemini-api-key
   ```

### **4️⃣ Run the App**
```bash
flutter run
```

---

## 🔐 Authentication (Supabase)
- **Signup** with email & password.
- **Login** securely with Supabase authentication.
- **Logout** functionality.
- **Password reset support**.

```dart
await supabase.auth.signUp(email: email, password: password);
await supabase.auth.signInWithPassword(email: email, password: password);
await supabase.auth.signOut();
```

---

## 🤖 AI Chat (Google gemini API)
- **Sends user input to Gemini API**.
- **Processes AI-generated responses**.
- **Handles API failures (503 errors) with retry logic**.

```dart
Future<String> sendMessage(String message) async {
  final response = await dio.post(
    dotenv.env['GOOGLE_GEMINI_API']!,
    options: Options(headers: {"X-goog-api-key": googleAPI}),

     data: {
            "contents": [
              {
                "parts": [
                  {"text": "your answer $message"}
                ]
              }
            ]
    },
  );
  return response.data["candidates"]?[0]?["content"]?["parts"]?[0]?["text"];
}
```

---

## 📱 Screenshots
(Include screenshots of the app UI here)

---

## 🛠️ Future Enhancements
✅ Add **Multi chat session Support**  
✅ Improve **User Interface for chat Screen**
✅ Improve **AI response speed**

---

## 📝 License
This project is **open-source** and free to use. Feel free to contribute! 🚀

---

## 🤝 Contributing
1. **Fork the repo**
2. **Create a feature branch** (`git checkout -b feature-name`)
3. **Commit changes** (`git commit -m "Added new feature"`)
4. **Push to the branch** (`git push origin feature-name`)
5. **Open a pull request** 🚀

---

## 📞 Contact
For any questions, feel free to reach out:
📧 Email: connectwithsubbu@gmail.com  
🐦 Twitter: [@developersubbu](https://x.com/)  

