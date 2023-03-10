
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shodaimamalistview/getData.dart';

import 'detailsView.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  @override
  void initState() {
    // TODO: implement initState
    var fetchData = Provider.of<getData>(context, listen: false);
    fetchData.getListData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    context.read<getData>().getListData();

    return Scaffold(
      appBar:AppBar(
        title: Text("List View Page"),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: Center(
          child: Consumer<getData>(
            builder:(context,value,child){
               return value.data.isEmpty
                  ? const CircularProgressIndicator()
                  : ListView.builder(
                  itemCount: value.data.length,
                  itemBuilder: (context,i){
                    return ListTile(
                      title: Text('1'),
                      subtitle: Text(value.data[i].author),
                      trailing: Icon(Icons.more_vert_outlined),
                      onTap: (){
                       
                      },
                    );
                  });
            }
          ),
        ),
      ),
    );
  }


  Future<void> _onRefresh() async{
    await Future.delayed(const Duration(seconds: 2));
    await context.read<getData>().getListData();

    setState(() {

    });
  }
}

