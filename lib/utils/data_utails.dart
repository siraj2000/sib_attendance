String monthName(int month) {
  const months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];
  return months[month - 1]; // عشان ليست تبدا 0
}

// // //داله فيها الاشهر
// String formatDate(DateTime date) {
//   return "${date.year}.${date.month.toString().padLeft(2, '0')}.${date.day.toString().padLeft(2, '0')}";
// }
