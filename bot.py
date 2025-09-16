from telegram import Update
from telegram.ext import ApplicationBuilder, CommandHandler, ContextTypes

# ضع التوكن الصحيح هنا
TOKEN = "8002740080:AAHEmAMqFD1iBTIdAjc49ULoP-chDL0N770"

async def spam_direct(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """
    إرسال الرسائل مباشرة بدون أي تأخير
    """
    try:
        count = int(context.args[0])  # عدد الرسائل
        text = " ".join(context.args[1:])  # نص الرسالة

        if count > 1000:  # حماية للتعليم فقط
            await update.message.reply_text("لأغراض تعليمية، الحد الأقصى هو 1000 رسالة فقط.")
            return

        for _ in range(count):
            await update.message.reply_text(text)

    except (IndexError, ValueError):
        await update.message.reply_text("استخدم الصيغة الصحيحة:\n/spam عدد_الرسائل نص_الرسالة")

# إنشاء التطبيق وتشغيله
app = ApplicationBuilder().token(TOKEN).build()
app.add_handler(CommandHandler("spam", spam_direct))

print("البوت يعمل…")
app.run_polling()
