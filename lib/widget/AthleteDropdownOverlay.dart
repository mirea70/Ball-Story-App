import 'package:flutter/material.dart';

import '../model/Athlete.dart';

class AthleteDropdownOverlay extends StatefulWidget {
  final List<Athlete> items;
  final Athlete? selected;
  final ValueChanged<Athlete> onSelected;
  const AthleteDropdownOverlay({
    super.key,
    required this.items,
    required this.selected,
    required this.onSelected,
  });

  @override
  State<AthleteDropdownOverlay> createState() => _AthleteDropdownOverlayState();
}

class _AthleteDropdownOverlayState extends State<AthleteDropdownOverlay> {
  final _link = LayerLink();
  OverlayEntry? _entry;
  bool get _isOpen => _entry != null;

  void _open() {
    if (_isOpen) return;
    _entry = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            // 바깥 터치 시 닫힘
            Positioned.fill(
              child: GestureDetector(
                onTap: _close,
                behavior: HitTestBehavior.translucent,
              ),
            ),
            // 앵커 바로 아래에 따라붙는 패널
            CompositedTransformFollower(
              link: _link,
              showWhenUnlinked: false,
              offset: const Offset(0, 48), // 컨테이너 높이만큼 아래
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(8),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.8,
                    maxHeight: MediaQuery.of(context).size.height * 0.5,
                  ),
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: const [
                            DataColumn(label: Text('코드')),
                            DataColumn(label: Text('이름')),
                            DataColumn(label: Text('팀')),
                            DataColumn(label: Text('포지션')),
                          ],
                          rows: widget.items.map((a) {
                            return DataRow(
                              onSelectChanged: (_) {
                                _close();
                                widget.onSelected(a);
                              },
                              cells: [
                                DataCell(Text('${a.code}')),
                                DataCell(Text(a.name)),
                                DataCell(Text(a.team.name)),
                                DataCell(Text(a.type.name)),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
    Overlay.of(context, rootOverlay: true).insert(_entry!);
    setState(() {});
  }

  void _close() {
    _entry?.remove();
    _entry = null;
    setState(() {});
  }

  @override
  void dispose() {
    _close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.selected == null
        ? '선수를 선택해주세요.'
        : '${widget.selected!.name} (${widget.selected!.team.name})';

    return CompositedTransformTarget(
      link: _link,
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: _isOpen ? _close : _open,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 2.0),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              const SizedBox(width: 12),
              Expanded(child: Text(title, style: const TextStyle(fontSize: 20))),
              AnimatedRotation(
                turns: _isOpen ? 0.5 : 0.0,
                duration: const Duration(milliseconds: 180),
                child: const Icon(Icons.arrow_downward_rounded),
              ),
              const SizedBox(width: 12),
            ],
          ),
        ),
      ),
    );
  }
}