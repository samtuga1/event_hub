import 'package:barcode_widget/barcode_widget.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_widget/ticket_widget.dart';

class Ticket extends StatelessWidget {
  static const routeName = '/ticket';
  const Ticket({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: const Color(0xffEEF0F9),
      appBar: AppBar(
        backgroundColor: const Color(0xffEEF0F9),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            CupertinoIcons.chevron_back,
            size: 30,
          ),
        ),
        elevation: 0,
        title: Text(
          'My Tickets',
          style: theme.headline2?.copyWith(
            fontSize: 28.sp,
          ),
        ),
      ),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            alignment: Alignment.center,
            children: [
              TicketWidget(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.8,
                isCornerRounded: false,
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.27,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/sark.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Wine Tasting',
                            maxLines: 2,
                            style: theme.headline2,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Date',
                                    style: theme.labelMedium,
                                  ),
                                  Text(
                                    'Fri June 8, 2022',
                                    style: theme.headline2?.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Time',
                                    style: theme.labelMedium,
                                  ),
                                  Text(
                                    '7:45AM',
                                    style: theme.headline2?.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Venue',
                                style: theme.labelMedium,
                              ),
                              Text(
                                'University of Ghana',
                                style: theme.headline2?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'R28 Street No. 4',
                                style: theme.headline2?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                left: 30.w,
                right: 30.w,
                child: BarcodeWidget(
                  width: MediaQuery.of(context).size.width * 0.7,
                  barcode: Barcode.code128(),
                  data: '101010298338',
                  height: 70,
                  errorBuilder: (context, error) => Center(
                    child: Text(
                      error,
                      style: theme.headline2?.copyWith(fontSize: 18.sp),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 215.w,
                left: 22,
                child: SizedBox(
                  width: (MediaQuery.of(context).size.width * 0.8) - 40,
                  child: const DottedLine(
                    lineThickness: 1,
                    dashLength: 4,
                    dashColor: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
