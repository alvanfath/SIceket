import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:siceket/core/core.dart';
import 'package:siceket/utils/utils.dart';

class TextFormSelectSearch extends StatefulWidget {
  final Map<String, dynamic>? dataSelected;
  final List<dynamic> listData;
  final String placeHolder;
  final String? label;
  final String idDisplay;
  final String textDisplay;
  final String? textAdditional;
  final String? modalTitle;
  final String searchPlaceholder;
  final Function1<dynamic, void> onSelect;
  const TextFormSelectSearch({
    super.key,
    this.dataSelected,
    required this.textDisplay,
    required this.placeHolder,
    this.label,
    required this.idDisplay,
    required this.listData,
    required this.searchPlaceholder,
    required this.onSelect,
    this.modalTitle,
    this.textAdditional,
  });

  @override
  State<TextFormSelectSearch> createState() => _TextFormSelectSearchState();
}

class _TextFormSelectSearchState extends State<TextFormSelectSearch> {
  @override
  Widget build(BuildContext context) {
    final Widget dataWidget = widget.dataSelected != null
        ? selectedText(
            widget.textAdditional != null
                ? '${widget.dataSelected![widget.textAdditional]} ${widget.dataSelected![widget.textDisplay]}'
                : widget.dataSelected![widget.textDisplay].toString(),
          )
        : placeHolderText(widget.placeHolder);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Column(
            children: [
              TextWidget(
                text: widget.label!,
                fontSize: Constants.get.sizeMd,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 8),
            ],
          ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return DropdownSearch(
                  dataSelected: widget.dataSelected ?? {},
                  label: widget.modalTitle ?? widget.placeHolder,
                  keyId: widget.idDisplay,
                  displayKey: widget.textDisplay,
                  listData: widget.listData,
                  placeHolderSearch: widget.searchPlaceholder,
                  additionalKey: widget.textAdditional,
                  onSelected: widget.onSelect,
                );
              },
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 1,
                  color: Color(0xFFDDDDDD),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                dataWidget,
                const HeroIcon(
                  HeroIcons.chevronDown,
                  style: HeroIconStyle.solid,
                  size: 16,
                  color: Color(0xff71808E),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget selectedText(String text) {
    return TextWidget(
      text: shortText(text, 35),
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
  }

  Widget placeHolderText(String text) {
    return TextWidget(
      text: text,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: const Color(0xff9BA6AF),
    );
  }
}

class DropdownSearch extends StatefulWidget {
  final Map<String, dynamic> dataSelected;
  final String label;
  final String placeHolderSearch;
  final String keyId;
  final String displayKey;
  final String? additionalKey;
  final List<dynamic> listData;
  final Function1<dynamic, void> onSelected;

  const DropdownSearch({
    super.key,
    required this.dataSelected,
    required this.label,
    required this.keyId,
    required this.displayKey,
    required this.listData,
    required this.placeHolderSearch,
    required this.onSelected,
    this.additionalKey,
  });

  @override
  State<DropdownSearch> createState() => _DropdownSearchState();
}

class _DropdownSearchState extends State<DropdownSearch> {
  List<dynamic> _filteredData = [];
  final controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    setState(() {
      _filteredData = widget.listData;
    });
  }

  void filterData(String searchTerm) {
    setState(() {
      _filteredData = searchInList(widget.listData, searchTerm);
    });
  }

  List<dynamic> searchInList(
    List<dynamic> originalList,
    String searchTerm,
  ) {
    final List<String> keys = [
      widget.displayKey,
    ];
    if (widget.additionalKey != null) {
      keys.add(widget.additionalKey!);
    }
    List<String> searchTerms =
        searchTerm.toLowerCase().split(' ').map((term) => term.trim()).toList();

    return originalList.where((map) {
      return searchTerms.every((term) {
        return keys.any((key) {
          return map[key].toString().toLowerCase().contains(term);
        });
      });
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height / 1.5,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Color(0xffEEEEEE),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: widget.label,
                      fontSize: Constants.get.sizeLg,
                      fontWeight: FontWeight.w600,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close,
                        color: Color(0xffAAAAAA),
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                width: MediaQuery.of(context).size.width,
                child: TextF(
                  isHintVisible: false,
                  onChanged: filterData,
                  controller: controller,
                  hintText: widget.placeHolderSearch,
                  suffixIcon: const HeroIcon(
                    HeroIcons.magnifyingGlass,
                    size: 16,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: _filteredData.map((e) {
                      final isSelect =
                          e[widget.keyId] == widget.dataSelected[widget.keyId];
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Navigator.pop(context);
                          widget.onSelected(e);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                          ),
                          width: MediaQuery.of(context).size.width,
                          color:
                              isSelect ? const Color(0xffF1FCF4) : Colors.white,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0xffEEEEEE),
                                  width: 1,
                                ),
                              ),
                            ),
                            child: TextWidget(
                              text: widget.additionalKey != null
                                  ? '${e[widget.additionalKey]} ${e[widget.displayKey]}'
                                  : e[widget.displayKey].toString(),
                              fontSize: 14,
                              fontWeight:
                                  isSelect ? FontWeight.w500 : FontWeight.w400,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextFormSelect extends StatefulWidget {
  final Map<String, dynamic>? dataSelected;
  final Function1<Map<String, dynamic>, void> onSelect;
  final String placeHolder;
  final String label;
  final String idDisplay;
  final String textDisplay;
  final List<dynamic> listData;
  final String? titleModal;
  const TextFormSelect({
    super.key,
    this.dataSelected,
    required this.textDisplay,
    required this.placeHolder,
    required this.label,
    required this.onSelect,
    required this.idDisplay,
    required this.listData,
    this.titleModal,
  });

  @override
  State<TextFormSelect> createState() => _TextFormSelectState();
}

class _TextFormSelectState extends State<TextFormSelect> {
  @override
  Widget build(BuildContext context) {
    final Widget dataWidget = widget.dataSelected != null
        ? selectedText(widget.dataSelected![widget.textDisplay].toString())
        : placeHolderText(widget.placeHolder);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: widget.label,
          fontSize: Constants.get.sizeMd,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 8),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return TextSelectDropdown(
                  dataSelected: widget.dataSelected,
                  label: widget.titleModal ?? widget.placeHolder,
                  keyId: widget.idDisplay,
                  displayKey: widget.textDisplay,
                  listData: widget.listData,
                  action: (value) {
                    widget.onSelect(value);
                  },
                );
              },
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 1,
                  color: Color(0xFFDDDDDD),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                dataWidget,
                const HeroIcon(
                  HeroIcons.chevronDown,
                  style: HeroIconStyle.solid,
                  size: 16,
                  color: Color(0xff71808E),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget selectedText(String text) {
    return TextWidget(
      text: shortText(text, 35),
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
  }

  Widget placeHolderText(String text) {
    return TextWidget(
      text: text,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: const Color(0xff9BA6AF),
    );
  }
}

class TextSelectDropdown extends StatefulWidget {
  final Map<String, dynamic>? dataSelected;
  final String label;
  final String keyId;
  final String displayKey;
  final List<dynamic> listData;
  final Function1<Map<String, dynamic>, void> action;

  const TextSelectDropdown({
    super.key,
    this.dataSelected,
    required this.label,
    required this.keyId,
    required this.displayKey,
    required this.listData,
    required this.action,
  });

  @override
  State<TextSelectDropdown> createState() => _TextSelectDropdownState();
}

class _TextSelectDropdownState extends State<TextSelectDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 24,
            ),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Color(0xffEEEEEE),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: widget.label,
                  fontSize: Constants.get.sizeLg,
                  fontWeight: FontWeight.w600,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    color: Color(0xffAAAAAA),
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
          listWidget(widget.listData),
        ],
      ),
    );
  }

  Widget listWidget(List<dynamic> list) {
    if (list.isEmpty) {
      return const SizedBox(
        height: 250,
        child: Center(
          child: TextWidget(
            text: 'Tidak ada opsi',
            align: TextAlign.center,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
    }
    return SizedBox(
        height: 250,
        child: SingleChildScrollView(
          child: Column(
            children: list.map((e) {
              final isSelect =
                  e[widget.keyId] == widget.dataSelected?[widget.keyId];
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Navigator.pop(context);
                  widget.action(e);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  width: MediaQuery.of(context).size.width,
                  color: isSelect ? const Color(0xffF1FCF4) : Colors.white,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xffEEEEEE),
                          width: 1,
                        ),
                      ),
                    ),
                    child: TextWidget(
                      text: e[widget.displayKey].toString(),
                      fontSize: 14,
                      fontWeight: isSelect ? FontWeight.w500 : FontWeight.w400,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ));
  }
}
