part of com.curi.app.callseslist.widgets;

class SearchInput extends StatefulWidget {
  const SearchInput({required this.hintText, super.key});

  final String hintText;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor:  Colors.gray[10],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              width: 1,
              color: Color(0xFFDEDEDE),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              width: 1,
              color: Colors.sunset[40]!,
            ),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black[0],
          ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF8A8E85),
          ),
        ),
      ),
    );
}
