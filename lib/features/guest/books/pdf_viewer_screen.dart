import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewerPage extends StatefulWidget {
  final String title;
  final String pdfPath;

  const PDFViewerPage({
    super.key,
    required this.title,
    required this.pdfPath,
  });

  @override
  State<PDFViewerPage> createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  final PdfViewerController _pdfViewerController = PdfViewerController();
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    // Small delay to let UI build first
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF2C7A7B);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: teal,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.zoom_in, color: Colors.white),
            onPressed: () {
              _pdfViewerController.zoomLevel += 0.2;
            },
          ),
          IconButton(
            icon: const Icon(Icons.zoom_out, color: Colors.white),
            onPressed: () {
              _pdfViewerController.zoomLevel -= 0.2;
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SfPdfViewer.asset(
            widget.pdfPath,
            controller: _pdfViewerController,
            onDocumentLoaded: (_) {
              setState(() => _isLoading = false);
            },
            onDocumentLoadFailed: (details) {
              setState(() {
                _isLoading = false;
                _errorMessage = details.error;
              });
            },
            enableDoubleTapZooming: true,
            canShowPaginationDialog: true,
            canShowScrollStatus: true,
            scrollDirection: PdfScrollDirection.vertical,
            pageLayoutMode: PdfPageLayoutMode.continuous,
            initialZoomLevel: 1.0,
          ),

          // Loading overlay
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.6),
              child: const Center(
                child: CircularProgressIndicator(color: teal),
              ),
            ),

          // Error overlay
          if (_errorMessage != null)
            Center(
              child: Padding(
                padding: EdgeInsets.all(32.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.error_outline_rounded, size: 64.sp, color: Colors.redAccent),
                    SizedBox(height: 16.h),
                    Text(
                      'Failed to load PDF',
                      style: TextStyle(fontSize: 20.sp, color: Colors.white),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      _errorMessage!,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14.sp, color: Colors.white70),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'Path used: ${widget.pdfPath}',
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pdfViewerController.dispose();
    super.dispose();
  }
}