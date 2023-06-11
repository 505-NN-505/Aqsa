import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/al_adhan_api_bloc.dart';

class AlAdhanApi extends StatefulWidget {
  const AlAdhanApi({super.key});

  @override
  State<AlAdhanApi> createState() => _AlAdhanApiState();
}

class _AlAdhanApiState extends State<AlAdhanApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prayer Times'),
      ),
      body: BlocBuilder<AlAdhanApiBloc, AlAdhanApiState>(
        builder: (context, state) {
          if (state is AlAdhanApiLoaded) {
            return Container(
              child: Center(
                child: Text(
                  state.model.data?.timings?.fajr ?? "N/A",
                  style: TextStyle(color: Colors.white, fontSize: 48),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
