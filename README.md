# 📢 PhraseBot - AI Chat App

PhraseBot is a **Flutter-based AI chatbot** that provides real-time conversations using **Facebook BlenderBot-3B** from Hugging Face API. It also features **user authentication with Supabase** for a secure and personalized experience.

---

## 🚀 Features
✅ **AI-Powered Chat** - Uses **Facebook BlenderBot-3B** for intelligent conversations.  
✅ **Supabase Authentication** - Secure login & signup with email/password.  
✅ **Real-time Messaging** - Smooth conversation flow with a chatbot.  
✅ **User Profile Management** - Store user data like names in Supabase.  
✅ **Flutter-based UI** - Cross-platform support for Android & iOS.  
✅ **Error Handling** - Manages API failures with retry mechanisms.  

---

## 🛠️ Tech Stack
- **Flutter** (Frontend Framework)
- **Hugging Face API** (AI Chatbot Backend - BlenderBot 3B)
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
   HUGGINGFACE_API_KEY=your-huggingface-api-key
   HUGGINGFACE_API_URL=https://api-inference.huggingface.co/yourmodel
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

## 🤖 AI Chat (Hugging Face API)
- **Sends user input to BlenderBot API**.
- **Processes AI-generated responses**.
- **Handles API failures (503 errors) with retry logic**.

```dart
Future<String> sendMessage(String message) async {
  final response = await dio.post(
    dotenv.env['HUGGINGFACE_API_URL']!,
    options: Options(headers: {"Authorization": "Bearer ${dotenv.env['HUGGINGFACE_API_KEY']}"}),
    data: {"inputs": message},
  );
  return response.data[0]["generated_text"];
}
```

---

## 📱 Screenshots
(Include screenshots of the app UI here)

---

## 🛠️ Future Enhancements
✅ Add **Dark Mode Support**  
✅ Enable **Voice Input** for chatting  
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

